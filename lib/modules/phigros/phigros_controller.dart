import 'dart:math';
import 'package:get/get.dart';
import 'package:rank_hub/models/phigros/song.dart';
import 'package:rank_hub/models/phigros/game_record.dart';
import 'package:rank_hub/modules/phigros/services/phigros_isar_service.dart';
import 'package:rank_hub/modules/phigros/services/phigros_resource_sync_service.dart';
import 'package:rank_hub/modules/phigros/services/phigros_score_sync_service.dart';
import 'package:rank_hub/controllers/account_controller.dart';

/// Phigros 控制器
class PhigrosController extends GetxController {
  final _isarService = PhigrosIsarService.instance;
  final _resourceSyncService = PhigrosResourceSyncService.instance;
  final _scoreSyncService = PhigrosScoreSyncService.instance;

  // 歌曲数据
  final songs = <PhigrosSong>[].obs;
  final filteredSongs = <PhigrosSong>[].obs;
  final isLoading = false.obs;

  // 搜索和筛选
  final searchKeyword = ''.obs;
  final selectedDifficulty = Rx<String?>(null);

  // 成绩数据
  final records = <PhigrosGameRecord>[].obs;
  final filteredRecords = <PhigrosGameRecord>[].obs;
  final recordSearchKeyword = ''.obs;
  final recordDifficultyFilter = Rx<String?>(null);

  // 玩家摘要数据
  final playerSummary = Rx<dynamic>(null);

  @override
  void onInit() {
    super.onInit();
    loadSongs();

    // 监听搜索和筛选条件变化
    ever(searchKeyword, (_) => _filterSongs());
    ever(selectedDifficulty, (_) => _filterSongs());

    // 监听成绩搜索和筛选
    ever(recordSearchKeyword, (_) => _filterRecords());
    ever(recordDifficultyFilter, (_) => _filterRecords());
  }

  /// 加载歌曲列表
  /// 自动判断：数据库有数据则从数据库加载，否则从网络同步
  Future<void> loadSongs({bool forceRefresh = false}) async {
    try {
      isLoading.value = true;

      // 检查数据库中是否有歌曲数据
      final songCount = await _isarService.getSongCount();

      if (songCount == 0 || forceRefresh) {
        // 数据库为空或强制刷新，从网络同步
        print('📥 数据库${songCount == 0 ? "为空" : "强制刷新"}，开始从网络同步歌曲数据...');

        await _resourceSyncService.syncAllDataToDatabase(
          onProgress: (current, total, description) {
            print('  进度: $current/$total - $description');
          },
        );
      }

      // 从数据库加载歌曲
      final songList = await _isarService.getAllSongs();
      songs.value = songList;
      _filterSongs();

      print('✅ 成功加载 ${songList.length} 首歌曲');
    } catch (e) {
      print('❌ 加载歌曲列表失败: $e');
      // 即使失败也尝试从数据库加载已有数据
      try {
        final songList = await _isarService.getAllSongs();
        songs.value = songList;
        _filterSongs();
      } catch (_) {}
    } finally {
      isLoading.value = false;
    }
  }

  /// 加载成绩列表
  /// 自动判断：数据库有数据则从数据库加载，否则从网络同步
  Future<void> loadRecords(
    String accountId, {
    bool forceRefresh = false,
  }) async {
    try {
      isLoading.value = true;

      // 检查数据库中是否有该账号的成绩数据
      final recordCount = await _isarService.getRecordCount(accountId);

      if (recordCount == 0 || forceRefresh) {
        // 数据库为空或强制刷新，从网络同步
        print('📥 数据库${recordCount == 0 ? "为空" : "强制刷新"}，开始从网络同步成绩数据...');

        // 第一步：确保曲库数据已同步（因为成绩解析需要曲库数据）
        final songCount = await _isarService.getSongCount();
        if (songCount == 0) {
          print('📥 检测到曲库为空，先同步曲库数据...');
          await _resourceSyncService.syncAllDataToDatabase(
            onProgress: (current, total, description) {
              print('  [曲库] 进度: $current/$total - $description');
            },
          );
        }

        // 第二步：同步玩家成绩数据
        // 获取账号信息
        final accountController = Get.find<AccountController>();
        final account = accountController.currentAccount;

        if (account != null && account.apiKey != null) {
          await _scoreSyncService.syncPlayerScoresToDatabase(
            accountId: accountId,
            sessionToken: account.apiKey!,
            onProgress: (current, total, description) {
              print('  [成绩] 进度: $current/$total - $description');
            },
          );
        } else {
          print('⚠️ 未找到有效的账号信息，跳过成绩同步');
        }
      }

      // 从数据库加载成绩
      final recordList = await _isarService.getGameRecords(accountId);
      records.value = recordList;
      _filterRecords();

      // 加载玩家摘要数据
      final summary = await _isarService.getPlayerSummary(accountId);
      if (summary != null) {
        playerSummary.value = summary;
        print('✅ 成功加载玩家摘要数据 RKS: ${summary.totalRks.toStringAsFixed(2)}');
      }

      print('✅ 成功加载 ${recordList.length} 条成绩记录');
    } catch (e) {
      print('❌ 加载成绩列表失败: $e');
      // 即使失败也尝试从数据库加载已有数据
      try {
        final recordList = await _isarService.getGameRecords(accountId);
        records.value = recordList;
        _filterRecords();
      } catch (_) {}
    } finally {
      isLoading.value = false;
    }
  }

  /// 设置搜索关键词
  void setSearchKeyword(String keyword) {
    searchKeyword.value = keyword;
  }

  /// 设置难度筛选
  void setDifficultyFilter(String? difficulty) {
    selectedDifficulty.value = difficulty;
  }

  /// 设置成绩搜索关键词
  void setRecordSearchKeyword(String keyword) {
    recordSearchKeyword.value = keyword;
  }

  /// 设置成绩难度筛选
  void setRecordDifficultyFilter(String? difficulty) {
    recordDifficultyFilter.value = difficulty;
  }

  /// 筛选歌曲
  void _filterSongs() {
    var filtered = songs.toList();

    // 搜索关键词筛选
    if (searchKeyword.value.isNotEmpty) {
      final keyword = searchKeyword.value.toLowerCase();
      filtered = filtered.where((song) {
        return song.name.toLowerCase().contains(keyword) ||
            song.composer.toLowerCase().contains(keyword) ||
            (song.illustrator?.toLowerCase().contains(keyword) ?? false);
      }).toList();
    }

    // 难度筛选
    if (selectedDifficulty.value != null) {
      final difficulty = selectedDifficulty.value!;
      filtered = filtered.where((song) {
        switch (difficulty) {
          case 'EZ':
            return song.difficultyEZ != null && song.difficultyEZ! > 0;
          case 'HD':
            return song.difficultyHD != null && song.difficultyHD! > 0;
          case 'IN':
            return song.difficultyIN != null && song.difficultyIN! > 0;
          case 'AT':
            return song.difficultyAT != null && song.difficultyAT! > 0;
          default:
            return true;
        }
      }).toList();
    }

    filteredSongs.value = filtered;
  }

  /// 筛选成绩
  void _filterRecords() {
    var filtered = records.toList();

    // 搜索关键词筛选
    if (recordSearchKeyword.value.isNotEmpty) {
      final keyword = recordSearchKeyword.value.toLowerCase();
      filtered = filtered.where((record) {
        return record.songName.toLowerCase().contains(keyword) ||
            record.artist.toLowerCase().contains(keyword);
      }).toList();
    }

    // 难度筛选
    if (recordDifficultyFilter.value != null) {
      filtered = filtered
          .where((record) => record.level == recordDifficultyFilter.value)
          .toList();
    }

    filteredRecords.value = filtered;
  }

  /// 获取歌曲统计信息
  Map<String, int> getSongStats() {
    return {
      'total': songs.length,
      'ez': songs
          .where((s) => s.difficultyEZ != null && s.difficultyEZ! > 0)
          .length,
      'hd': songs
          .where((s) => s.difficultyHD != null && s.difficultyHD! > 0)
          .length,
      'in': songs
          .where((s) => s.difficultyIN != null && s.difficultyIN! > 0)
          .length,
      'at': songs
          .where((s) => s.difficultyAT != null && s.difficultyAT! > 0)
          .length,
    };
  }

  /// 获取B30成绩
  /// 返回 Map，包含 'phi' (P1-P3：打到Phi的前三首歌按RKS排序) 和 'best' (B1-B27：剩下的歌按RKS取前27个)
  Map<String, List<PhigrosGameRecord>> getB30Records() {
    // 按RKS降序排序所有成绩
    final sortedRecords = records.toList()
      ..sort((a, b) => b.rks.compareTo(a.rks));

    // 过滤出打到Phi的成绩，取前3个
    final phiRecords = sortedRecords
        .where((record) => record.rating == 'ϕ')
        .take(3)
        .toList();

    // 移除已经在Phi列表中的成绩，从剩余成绩中取前27个
    final phiIds = phiRecords.map((r) => r.id).toSet();
    final bestRecords = sortedRecords
        .where((record) => !phiIds.contains(record.id))
        .take(27)
        .toList();

    return {'phi': phiRecords, 'best': bestRecords};
  }

  /// 计算个人RKS
  /// 公式: (P1 + P2 + P3 + B1~B27的平均) / 30
  double calculatePersonalRks() {
    final b30 = getB30Records();
    final phi = b30['phi'] ?? [];
    final best = b30['best'] ?? [];

    if (phi.isEmpty && best.isEmpty) return 0.0;

    final phiSum = phi.fold<double>(0.0, (sum, r) => sum + r.rks);
    final bestAvg = best.isEmpty
        ? 0.0
        : best.fold<double>(0.0, (sum, r) => sum + r.rks) / best.length;

    return (phiSum + bestAvg * 27) / 30;
  }

  /// 计算要使个人RKS提高0.01所需的ACC
  /// 参数:
  /// - currentRecord: 当前成绩
  /// - isInB30: 该成绩是否在B30中
  /// 返回: 所需的ACC百分比，如果无法达到则返回null
  double? calculateRequiredAccForRksIncrease(
    PhigrosGameRecord currentRecord,
    bool isInB30,
  ) {
    if (currentRecord.acc >= 100.0) return null; // 已经是Phi（100%），无需计算

    final currentPersonalRks = calculatePersonalRks();
    final targetPersonalRks = currentPersonalRks + 0.01;

    final b30 = getB30Records();
    final phi = b30['phi'] ?? [];
    final best = b30['best'] ?? [];

    // 计算该曲目打到100%时的RKS
    final maxRks = currentRecord.constant;

    // 情况1: 该曲目不在B30中，但打到100%可能进入P1-P3
    if (!isInB30) {
      // 检查打到100%后能否进入P1-P3
      if (phi.length < 3 || (phi.isNotEmpty && maxRks > phi.last.rks)) {
        // 能进入P1-P3，返回100%
        return 100.0;
      }
      // 无法通过该曲目影响个人RKS
      return null;
    }

    // 情况2: 该曲目已在B30中
    final allB30 = [...phi, ...best];
    final isInPhi = phi.any((r) => r.id == currentRecord.id);

    // 计算除了当前曲目外其他曲目的RKS总和
    final otherRksSum = allB30
        .where((r) => r.id != currentRecord.id)
        .fold<double>(0.0, (sum, r) => sum + r.rks);

    // 方案A: 在当前位置提升RKS
    // targetPersonalRks = (当前曲目RKS + 其他RKS总和) / 30
    final requiredRksA = targetPersonalRks * 30 - otherRksSum;

    double? accA;
    if (requiredRksA > 0 && currentRecord.constant > 0) {
      final calculatedAcc =
          sqrt(requiredRksA / currentRecord.constant) * 45 + 55;
      if (calculatedAcc <= 100 && calculatedAcc > currentRecord.acc) {
        accA = calculatedAcc;
      }
    }

    // 方案B: 如果不在P1-P3中，考虑打到100%进入P1-P3
    double? accB;
    if (!isInPhi && maxRks > (phi.isNotEmpty ? phi.last.rks : 0.0)) {
      // 模拟该曲目打到100%并进入P1-P3后的情况
      List<PhigrosGameRecord> newPhi = List.from(phi);

      // 创建100%的假设记录
      final maxRecord = PhigrosGameRecord()
        ..id = currentRecord.id
        ..accountId = currentRecord.accountId
        ..songId = currentRecord.songId
        ..songName = currentRecord.songName
        ..artist = currentRecord.artist
        ..level = currentRecord.level
        ..constant = currentRecord.constant
        ..score = 1000000
        ..acc = 100.0
        ..rks = maxRks
        ..fc = true
        ..lastUpdated = DateTime.now();

      newPhi.add(maxRecord);
      newPhi.sort((a, b) => b.rks.compareTo(a.rks));
      newPhi = newPhi.take(3).toList();

      // 重新计算B27（排除当前曲目和新P1-P3）
      final newPhiIds = newPhi.map((r) => r.id).toSet();
      final newBest =
          allB30
              .where(
                (r) => !newPhiIds.contains(r.id) && r.id != currentRecord.id,
              )
              .toList()
            ..sort((a, b) => b.rks.compareTo(a.rks));
      final newBest27 = newBest.take(27).toList();

      // 计算新的个人RKS
      final newPhiSum = newPhi.fold<double>(0.0, (sum, r) => sum + r.rks);
      final newBestAvg = newBest27.isEmpty
          ? 0.0
          : newBest27.fold<double>(0.0, (sum, r) => sum + r.rks) /
                newBest27.length;
      final newPersonalRks = (newPhiSum + newBestAvg * 27) / 30;

      // 如果打到100%能使个人RKS提升0.01或更多
      if (newPersonalRks >= targetPersonalRks) {
        accB = 100.0;
      }
    }

    // 返回较小的ACC要求（即更容易达到的方案）
    if (accA != null && accB != null) {
      return accA < accB ? accA : accB;
    }
    return accA ?? accB;
  }
}
