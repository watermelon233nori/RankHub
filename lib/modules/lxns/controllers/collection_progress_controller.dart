import 'package:get/get.dart';
import 'package:rank_hub/models/maimai/collection.dart';
import 'package:rank_hub/models/maimai/score.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/modules/lxns/services/maimai_isar_service.dart';
import 'package:rank_hub/modules/lxns/services/maimai_api_service.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';

/// 藏品完成度信息
class CollectionProgress {
  final MaimaiCollection collection;
  final int totalCharts; // 总谱面数
  final int completedCharts; // 已完成谱面数
  final Map<LevelIndex, int> completedByDifficulty; // 各难度完成数
  final Map<LevelIndex, int> totalByDifficulty; // 各难度总数
  final List<SongProgress> songProgresses;
  final bool isPinned;
  final List<Version> versions; // 所有涉及的版本信息

  CollectionProgress({
    required this.collection,
    required this.totalCharts,
    required this.completedCharts,
    required this.completedByDifficulty,
    required this.totalByDifficulty,
    required this.songProgresses,
    this.isPinned = false,
    this.versions = const [],
  });

  double get progress => totalCharts > 0 ? completedCharts / totalCharts : 0.0;

  /// 获取某个难度的完成进度
  double getProgressByDifficulty(LevelIndex difficulty) {
    final total = totalByDifficulty[difficulty] ?? 0;
    final completed = completedByDifficulty[difficulty] ?? 0;
    return total > 0 ? completed / total : 0.0;
  }
}

/// 单曲完成度信息
class SongProgress {
  final int songId;
  final String title;
  final String type;
  final List<LevelIndex> requiredDifficulties;
  final List<LevelIndex> completedDifficulties;
  final bool isCompleted;
  final Song? songDetail;

  SongProgress({
    required this.songId,
    required this.title,
    required this.type,
    required this.requiredDifficulties,
    required this.completedDifficulties,
    required this.isCompleted,
    this.songDetail,
  });
}

/// 藏品完成度控制器
class CollectionProgressController extends GetxController {
  final _isarService = MaimaiIsarService.instance;

  // 对外暴露 isarService 供 UI 使用
  MaimaiIsarService get isarService => _isarService;

  // 所有有曲目要求的藏品
  final allCollectionsWithSongs = <MaimaiCollection>[].obs;

  // 当前选中查看的藏品
  final selectedCollection = Rx<MaimaiCollection?>(null);

  // 当前藏品的完成度信息
  final currentProgress = Rx<CollectionProgress?>(null);

  // 固定的藏品列表
  final pinnedCollections = <CollectionProgress>[].obs;

  // 加载状态
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCollections();
  }

  /// 加载所有有曲目要求的藏品
  Future<void> loadCollections() async {
    isLoading.value = true;
    try {
      final allCollections = await _isarService.getAllCollections();

      // 筛选出有曲目要求的藏品
      final collectionsWithSongs = allCollections.where((collection) {
        return collection.required.any((req) => req.songs.isNotEmpty);
      }).toList();

      // 如果没有找到有曲目要求的藏品，尝试重新同步带要求的数据
      if (collectionsWithSongs.isEmpty) {
        print('📦 未找到有曲目要求的藏品，开始同步带要求的藏品数据...');

        try {
          await MaimaiApiService.instance.syncCollectionsToDatabase(
            includeRequired: true,
            onProgress: (current, total, description) {
              print('🔄 [$current/$total] $description');
            },
          );

          print('✅ 藏品数据同步完成，重新加载...');

          // 重新从数据库获取藏品
          final updatedCollections = await _isarService.getAllCollections();
          final updatedCollectionsWithSongs = updatedCollections.where((
            collection,
          ) {
            return collection.required.any((req) => req.songs.isNotEmpty);
          }).toList();

          allCollectionsWithSongs.value = updatedCollectionsWithSongs;

          if (updatedCollectionsWithSongs.isNotEmpty) {
            Get.snackbar(
              '同步成功',
              '已同步 ${updatedCollectionsWithSongs.length} 个有曲目要求的藏品',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            Get.snackbar(
              '提示',
              '当前版本暂无有曲目要求的藏品',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } catch (e) {
          print('❌ 同步藏品数据失败: $e');
          Get.snackbar(
            '同步失败',
            '无法获取藏品数据: $e',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        allCollectionsWithSongs.value = collectionsWithSongs;
      }

      // 加载固定的藏品
      await loadPinnedCollections();
    } finally {
      isLoading.value = false;
    }
  }

  /// 加载固定的藏品及其完成度
  Future<void> loadPinnedCollections() async {
    final pinned = await _isarService.getAllPinnedCollections();
    final progressList = <CollectionProgress>[];

    for (final pinnedItem in pinned) {
      final collection = await _isarService.getCollectionByTypeAndId(
        pinnedItem.collectionType,
        pinnedItem.collectionId,
      );

      if (collection != null) {
        final progress = await calculateProgress(collection);
        progressList.add(progress.copyWith(isPinned: true));
      }
    }

    pinnedCollections.value = progressList;
  }

  /// 计算藏品完成度（按谱面数计算）
  Future<CollectionProgress> calculateProgress(
    MaimaiCollection collection,
  ) async {
    final songProgresses = <SongProgress>[];
    int totalCharts = 0;
    int completedCharts = 0;
    final completedByDifficulty = <LevelIndex, int>{};
    final totalByDifficulty = <LevelIndex, int>{};
    final songVersionNumbers = <int>{}; // 收集所有不同的版本号

    // 遍历所有要求
    for (final req in collection.required) {
      if (req.songs.isEmpty) continue;

      for (final reqSong in req.songs) {
        // 获取曲目详情
        final songDetail = await _isarService.getSongById(reqSong.id);

        // 收集版本号
        if (songDetail != null) {
          songVersionNumbers.add(songDetail.version);
        }

        // 获取该曲目的成绩
        final scores = await _isarService.getScoresBySongId(reqSong.id);

        // 判断哪些难度已完成
        final completedDiffs = <LevelIndex>[];
        for (final diff in req.difficulties) {
          // 统计总谱面数
          totalCharts++;
          totalByDifficulty[diff] = (totalByDifficulty[diff] ?? 0) + 1;

          final hasScore = scores.any(
            (score) =>
                score.levelIndex == diff && _meetsRequirement(score, req),
          );

          if (hasScore) {
            completedDiffs.add(diff);
            completedCharts++;
            completedByDifficulty[diff] =
                (completedByDifficulty[diff] ?? 0) + 1;
          }
        }

        // 判断该曲目是否完成（所有要求的难度都完成）
        final isCompleted = req.difficulties.every(
          (diff) => completedDiffs.contains(diff),
        );

        songProgresses.add(
          SongProgress(
            songId: reqSong.id,
            title: reqSong.title,
            type: reqSong.type.name,
            requiredDifficulties: req.difficulties,
            completedDifficulties: completedDiffs,
            isCompleted: isCompleted,
            songDetail: songDetail,
          ),
        );
      }
    }

    // 获取所有涉及的版本信息
    final versions = <Version>[];
    if (songVersionNumbers.isNotEmpty) {
      try {
        final allVersions = await _isarService.getAllVersions();
        print('ℹ️ 共找到 ${allVersions.length} 个版本信息');
        allVersions.sort((a, b) => b.version.compareTo(a.version));

        final versionMap = <int, Version>{};

        // 为每个版本号找到对应的版本信息
        for (final versionNumber in songVersionNumbers) {
          Version? matchedVersion;

          if (allVersions.isNotEmpty) {
            if (versionNumber >= allVersions.first.version) {
              matchedVersion = allVersions.first;
            } else if (versionNumber < allVersions.last.version) {
              matchedVersion = allVersions.last;
            } else {
              for (int i = 0; i < allVersions.length - 1; i++) {
                final currentVersion = allVersions[i];
                final nextVersion = allVersions[i + 1];
                if (versionNumber >= nextVersion.version &&
                    versionNumber < currentVersion.version) {
                  matchedVersion = nextVersion;
                  break;
                }
              }
            }
          }

          if (matchedVersion != null) {
            versionMap[matchedVersion.versionId] = matchedVersion;
          }
        }

        // 转换为列表并按版本号排序
        versions.addAll(
          versionMap.values.toList()
            ..sort((a, b) => b.version.compareTo(a.version)),
        );

        print('ℹ️ 藏品涉及的版本: ${versions.map((v) => v.title).join(', ')}');
      } catch (e) {
        print('⚠️ 获取版本信息失败: $e');
      }
    }

    return CollectionProgress(
      collection: collection,
      totalCharts: totalCharts,
      completedCharts: completedCharts,
      completedByDifficulty: completedByDifficulty,
      totalByDifficulty: totalByDifficulty,
      songProgresses: songProgresses,
      versions: versions,
    );
  }

  /// 判断成绩是否满足要求
  bool _meetsRequirement(Score score, CollectionRequired req) {
    // 检查评级要求
    if (req.rate != null && (score.rate?.index ?? -1) > req.rate!.index) {
      return false;
    }

    // 检查 FC 要求
    if (req.fc != null && (score.fc?.index ?? -1) < req.fc!.index) {
      return false;
    }

    // 检查 FS 要求
    if (req.fs != null && (score.fs?.index ?? -1) < req.fs!.index) {
      return false;
    }

    return true;
  }

  /// 固定/取消固定藏品
  Future<void> togglePin(MaimaiCollection collection) async {
    final isPinned = await _isarService.isCollectionPinned(
      collection.collectionId,
      collection.collectionType,
    );

    if (isPinned) {
      await _isarService.unpinCollection(
        collection.collectionId,
        collection.collectionType,
      );
    } else {
      await _isarService.pinCollection(
        collection.collectionId,
        collection.collectionType,
      );
    }

    // 重新加载固定列表
    await loadPinnedCollections();
  }

  /// 选择藏品查看详情
  Future<void> selectCollection(MaimaiCollection collection) async {
    selectedCollection.value = collection;
    isLoading.value = true;

    try {
      final progress = await calculateProgress(collection);
      currentProgress.value = progress;
    } finally {
      isLoading.value = false;
    }
  }

  /// 刷新当前藏品的完成度
  Future<void> refreshCurrentProgress() async {
    if (selectedCollection.value != null) {
      await selectCollection(selectedCollection.value!);
    }
    await loadPinnedCollections();
  }
}

// 扩展方法用于复制 CollectionProgress
extension CollectionProgressExtension on CollectionProgress {
  CollectionProgress copyWith({bool? isPinned}) {
    return CollectionProgress(
      collection: collection,
      totalCharts: totalCharts,
      completedCharts: completedCharts,
      completedByDifficulty: completedByDifficulty,
      totalByDifficulty: totalByDifficulty,
      songProgresses: songProgresses,
      isPinned: isPinned ?? this.isPinned,
      versions: versions,
    );
  }
}
