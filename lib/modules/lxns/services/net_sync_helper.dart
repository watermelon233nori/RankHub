import 'package:get/get.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/modules/lxns/services/lxns_credential_provider.dart';
import 'package:techno_kitchen_dart/techno_kitchen_dart.dart';
import 'package:rank_hub/models/maimai/net_score.dart';
import 'package:rank_hub/models/maimai/score.dart';
import 'package:rank_hub/models/maimai/enums/song_type.dart';
import 'package:rank_hub/modules/lxns/services/maimai_net_api_service.dart';
import 'package:rank_hub/modules/lxns/services/maimai_api_service.dart';
import 'package:rank_hub/modules/lxns/services/maimai_isar_service.dart';

/// NET 成绩同步辅助类
/// 提供统一的 NET 成绩获取和上传逻辑
class NetSyncHelper {
  NetSyncHelper._();

  /// 从 NET 获取成绩并上传到 LXNS 查分器
  ///
  /// [accessToken] LXNS 访问令牌
  /// [qrCode] QR Code，用于创建会话
  /// [onProgress] 进度回调 (progress 0.0-1.0, message, count)
  ///
  /// 返回上传的成绩数量
  static Future<int> syncNetScoresToLxns({
    required String qrCode,
    Function(double progress, String message, int count)? onProgress,
  }) async {
    UserSession? session;

    try {
      // 1. 先更新曲库 (0% - 20%)
      onProgress?.call(0.0, '正在更新曲库...', 0);

      await MaimaiApiService.instance.syncSongsToDatabase(
        onProgress: (current, total, description) {
          final progress = total > 0 ? current / total * 0.2 : 0.0;
          onProgress?.call(progress, description, 0);
        },
      );

      // 2. 创建并初始化会话
      onProgress?.call(0.2, '正在连接 NET...', 0);

      session = MaimaiNetApiService.instance.createSessionFromQrCode(qrCode);

      // 初始化并登录
      await MaimaiNetApiService.instance.initAndLogin(session);

      // 3. 从 NET 获取所有成绩 (20% - 60%)
      onProgress?.call(0.2, '正在从 NET 获取成绩...', 0);

      final netScores = await MaimaiNetApiService.instance.getAllUserScores(
        session,
        onProgress: (current, total, description) {
          final progress = total > 0 ? 0.2 + (current / total * 0.4) : 0.2;
          onProgress?.call(progress, description, current);
        },
      );

      // 4. 转换为 Score 对象 (60% - 70%)
      onProgress?.call(0.6, '正在转换成绩数据...', netScores.length);

      final allScores = await _convertNetScoresToScores(netScores);

      // 5. 过滤本地不存在的乐曲 (70% - 80%)
      onProgress?.call(0.7, '正在验证乐曲数据...', allScores.length);

      final scores = await _filterExistingSongs(allScores);

      final filteredCount = allScores.length - scores.length;
      if (filteredCount > 0) {
        print('⚠️ 已过滤 $filteredCount 条本地不存在的乐曲成绩');
      }

      // 6. 上传到 LXNS 查分器 (80% - 100%)
      onProgress?.call(0.8, '正在上传到查分器... (${scores.length}条成绩)', scores.length);

      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;
      final credentialProvider = LxnsCredentialProvider();
      final account = await credentialProvider.getCredential(currentAccount!);

      await MaimaiApiService.instance.uploadScoresToLxns(
        accessToken: account.accessToken!,
        scores: scores,
        onProgress: (current, total, description) {
          final progress = total > 0 ? 0.8 + (current / total * 0.2) : 0.8;
          onProgress?.call(progress, description, scores.length);
        },
      );

      onProgress?.call(1.0, '同步完成！', scores.length);

      return scores.length;
    } finally {
      // 确保登出
      if (session != null) {
        try {
          await MaimaiNetApiService.instance.logout(session);
        } catch (e) {
          print('登出失败: $e');
        }
      }
    }
  }

  /// 将 NET 成绩转换为标准 Score 对象
  ///
  /// 根据乐曲 ID 判断谱面类型：
  /// - ID > 10000: DX 谱面，songId 需要对 10000 取模
  /// - ID <= 10000: 标准谱面
  static Future<List<Score>> _convertNetScoresToScores(
    List<NetScore> netScores,
  ) async {
    final scores = <Score>[];

    for (final netScore in netScores) {
      // 只转换有成绩的记录
      if (netScore.achievement > 0) {
        // 根据乐曲 ID 判断谱面类型
        final isDxType = netScore.musicId > 10000;
        final songType = isDxType ? SongType.dx : SongType.standard;

        // DX 谱面需要对 ID 取模
        final actualSongId = isDxType
            ? netScore.musicId - 10000
            : netScore.musicId;

        // 先转换为基础 Score
        final baseScore = netScore.toScore(type: songType);

        // 如果是 DX 谱面，需要修正 songId
        final score = isDxType
            ? Score(
                songId: actualSongId,
                songName: baseScore.songName,
                level: baseScore.level,
                levelIndex: baseScore.levelIndex,
                achievements: baseScore.achievements,
                fc: baseScore.fc,
                fs: baseScore.fs,
                dxScore: baseScore.dxScore,
                dxStar: baseScore.dxStar,
                dxRating: baseScore.dxRating,
                rate: baseScore.rate,
                type: baseScore.type,
                playTime: baseScore.playTime,
                uploadTime: baseScore.uploadTime,
                lastPlayedTime: baseScore.lastPlayedTime,
              )
            : baseScore;

        scores.add(score);
      }
    }

    return scores;
  }

  /// 过滤本地数据库中不存在的乐曲
  ///
  /// 只保留本地数据库中存在的乐曲成绩
  static Future<List<Score>> _filterExistingSongs(List<Score> scores) async {
    final isarService = MaimaiIsarService.instance;
    final validScores = <Score>[];

    for (final score in scores) {
      // 检查本地数据库中是否存在该乐曲
      final song = await isarService.getSongById(score.songId);

      if (song != null) {
        validScores.add(score);
      } else {
        print('⚠️ 跳过不存在的乐曲: ID=${score.songId}, Type=${score.type.value}');
      }
    }

    return validScores;
  }
}
