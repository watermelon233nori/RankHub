import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/musedash/musedash_controller.dart';
import 'package:rank_hub/models/musedash/musedash_score.dart';
import 'package:rank_hub/models/musedash/musedash_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/controllers/account_controller.dart';

/// MuseDash B30 成绩页面
class MuseDashScoresPage extends StatefulWidget {
  const MuseDashScoresPage({super.key});

  @override
  State<MuseDashScoresPage> createState() => _MuseDashScoresPageState();
}

class _MuseDashScoresPageState extends State<MuseDashScoresPage> {
  final controller = Get.find<MuseDashController>();
  bool _isLoading = false;
  String _errorMessage = '';
  MuseDashPlayer? _player;
  List<MuseDashScore> _scores = [];

  @override
  void initState() {
    super.initState();
    _syncAndLoadScores();
  }

  Future<void> _syncAndLoadScores() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // 获取当前账号的 UUID
      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;

      if (currentAccount == null || currentAccount.apiKey == null) {
        setState(() {
          _errorMessage = '请先绑定 MuseDash 账号';
          _isLoading = false;
        });
        return;
      }

      final userUuid = currentAccount.apiKey!;

      // 先尝试从本地加载
      final localPlayer = await controller.getPlayerInfo(userUuid);
      final localScores = await controller.getBest30Scores(userUuid);

      if (localPlayer != null) {
        setState(() {
          _player = localPlayer;
          _scores = localScores;
        });
        _sortByPlatformRank();
      }

      // 后台同步最新数据
      await controller.syncPlayerScores(userUuid);

      // 重新加载
      final player = await controller.getPlayerInfo(userUuid);
      final scores = await controller.getBest30Scores(userUuid);

      setState(() {
        _player = player;
        _scores = scores;
        _isLoading = false;
      });
      // 按客户端排名排序（升序）
      _sortByPlatformRank();
    } catch (e) {
      setState(() {
        _errorMessage = '加载成绩失败: $e';
        _isLoading = false;
      });
    }
  }

  void _sortByPlatformRank() {
    setState(() {
      _scores.sort((a, b) {
        final aRank = a.platformRank ?? 999999;
        final bRank = b.platformRank ?? 999999;
        return aRank.compareTo(bRank); // 升序
      });
    });
  }

  Future<void> _onRefresh() async {
    try {
      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;

      if (currentAccount == null || currentAccount.apiKey == null) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('请先绑定 MuseDash 账号')));
        }
        return;
      }

      final userUuid = currentAccount.apiKey!;

      // 同步成绩
      await controller.syncPlayerScores(userUuid);

      // 重新加载
      final player = await controller.getPlayerInfo(userUuid);
      final scores = await controller.getBest30Scores(userUuid);

      setState(() {
        _player = player;
        _scores = scores;
        _errorMessage = '';
      });
      _sortByPlatformRank();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('成绩同步成功')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('同步失败: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 玩家信息卡片
          if (_player != null) _buildPlayerInfoCard(_player!),

          // 成绩列表（带刷新指示器）
          Expanded(child: _buildScoresList()),
        ],
      ),
    );
  }

  /// 玩家信息卡片
  Widget _buildPlayerInfoCard(MuseDashPlayer player) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.nickname,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'RL: ${player.rl.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Best 30 标签
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                'B${_scores.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 成绩列表
  Widget _buildScoresList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(_errorMessage),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _syncAndLoadScores,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (_scores.isEmpty) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_off, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('暂无成绩数据'),
                  SizedBox(height: 8),
                  Text(
                    '下拉刷新获取最新成绩',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 100,
        ),
        itemCount: _scores.length,
        itemBuilder: (context, index) {
          final score = _scores[index];
          return _buildScoreCard(score, index + 1);
        },
      ),
    );
  }

  /// 成绩卡片
  Widget _buildScoreCard(MuseDashScore score, int rank) {
    // 获取音乐信息
    final music = controller.music.firstWhereOrNull(
      (m) => m.uid == score.musicUid,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 第一行：封面 + 曲名曲师
            Row(
              children: [
                // 封面图
                if (music != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: music.coverUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                        child: const Icon(Icons.music_note, size: 24),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 24),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.music_note, size: 24),
                  ),

                const SizedBox(width: 12),

                // 曲名和作者
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 曲名
                      Text(
                        music?.name ?? score.musicUid,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      // 作者
                      if (music != null)
                        Text(
                          music.author,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // 第二行：成绩信息 + 难度
            Row(
              children: [
                // 难度chip
                _buildDifficultyChip(score.difficulty, score),
                const SizedBox(width: 12),
                // 分数
                if (score.score != null) ...[
                  Text(
                    score.score.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                // 准确率
                Text(
                  '${(score.acc ?? 0).toStringAsFixed(2)}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                // 评级
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _getRankBadgeColor(score.rank),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    score.rank,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 第三行：排名信息
            Row(
              children: [
                // 排名信息
                if (score.globalRank != null) ...[
                  Icon(Icons.public, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 3),
                  Text(
                    '#${score.globalRank}',
                    style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                ],
                if (score.platformRank != null) ...[
                  Icon(Icons.devices, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 3),
                  Text(
                    '#${score.platformRank}',
                    style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                ],
                // 平台标签
                if (score.platform != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      score.platform!.toUpperCase(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
              ],
            ),

            // 第四行：角色和精灵
            if (score.characterUid != null || score.elfinUid != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  // 角色
                  if (score.characterUid != null) ...[
                    Icon(Icons.person, size: 12, color: Colors.grey[600]),
                    const SizedBox(width: 3),
                    Text(
                      _getCharacterName(score.characterUid!),
                      style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 8),
                  ],
                  // 精灵
                  if (score.elfinUid != null) ...[
                    Icon(Icons.pets, size: 12, color: Colors.grey[600]),
                    const SizedBox(width: 3),
                    Text(
                      _getElfinName(score.elfinUid!),
                      style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 获取评级颜色
  Color _getRankBadgeColor(String rank) {
    switch (rank) {
      case 'SSS':
        return Colors.amber; // 金S
      case 'SS':
        return Colors.blueGrey; // 银S
      case 'S':
        return Colors.purple; // 紫S
      case 'A':
        return Colors.pink;
      case 'B':
        return Colors.blue;
      default:
        return Colors.brown;
    }
  }

  /// 获取角色名称
  String _getCharacterName(String characterUid) {
    try {
      final characterId = int.parse(characterUid);
      final character = controller.characters.firstWhereOrNull(
        (c) => c.characterId == characterId,
      );
      return character?.characterName ?? characterUid;
    } catch (e) {
      return characterUid;
    }
  }

  /// 获取精灵名称
  String _getElfinName(String elfinUid) {
    try {
      final elfinId = int.parse(elfinUid);
      final elfin = controller.elfins.firstWhereOrNull(
        (e) => e.elfinId == elfinId,
      );
      return elfin?.name ?? elfinUid;
    } catch (e) {
      return elfinUid;
    }
  }

  /// 难度chip
  Widget _buildDifficultyChip(int difficulty, MuseDashScore score) {
    // 获取音乐信息
    final music = controller.music.firstWhereOrNull(
      (m) => m.uid == score.musicUid,
    );

    // 获取该难度的等级数值
    String levelText = '?';
    if (music != null && difficulty < music.difficulty.length) {
      final level = music.difficulty[difficulty];
      if (level != '0') {
        levelText = level;
      }
    }

    Color color;
    switch (difficulty) {
      case 0:
        color = Colors.green;
        break;
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.purple;
        break;
      case 3:
        color = Colors.black;
        break;
      case 4:
        color = Colors.white;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        levelText,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: difficulty == 3 || difficulty == 4 ? Colors.white : color,
        ),
      ),
    );
  }
}
