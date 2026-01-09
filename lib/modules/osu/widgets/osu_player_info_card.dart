import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rank_hub/models/osu/osu_user.dart';

class OsuPlayerInfoCard extends StatelessWidget {
  final OsuUser user;

  const OsuPlayerInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // 1. 获取所有可用模式的数据
    final modes = [
      {
        'id': 'osu',
        'name': 'osu!',
        'icon': Icons.circle_outlined,
        'json': user.stdStatisticsJson,
        'order': 0, // Fallback order
      },
      {
        'id': 'taiko',
        'name': 'taiko',
        'icon': Icons.radio_button_checked,
        'json': user.taikoStatisticsJson,
        'order': 1,
      },
      {
        'id': 'fruits',
        'name': 'catch',
        'icon': Icons.local_pizza_outlined,
        'json': user.catchStatisticsJson,
        'order': 2,
      },
      {
        'id': 'mania',
        'name': 'mania',
        'icon': Icons.grid_view,
        'json': user.maniaStatisticsJson,
        'order': 3,
      },
    ];

    // 2. 过滤掉没有数据的模式（虽然登录时都请求了，但防一手）
    final availableModes = modes.where((m) => m['json'] != null).toList();

    if (availableModes.isEmpty) {
      // 如果没有任何模式数据（理论上不应发生），回退到只显示基本信息
      return _buildSingleCard(
        context,
        user.username,
        user.playmode ?? 'osu',
        _extractStats(user),
      );
    }

    // 3. 排序逻辑：按 globalRank 从小到大（排名越靠前越好）
    // 如果 rank 为空，则视为最大值（排在后面）
    // 如果 rank 相同或都为空，则按默认顺序 osu -> taiko -> catch -> mania
    availableModes.sort((a, b) {
      final statsA = _parseStats(
        jsonDecode(a['json'] as String) as Map<String, dynamic>,
      );
      final statsB = _parseStats(
        jsonDecode(b['json'] as String) as Map<String, dynamic>,
      );

      final rankA = statsA.globalRank;
      final rankB = statsB.globalRank;

      if (rankA != null && rankB != null) {
        return rankA.compareTo(rankB);
      } else if (rankA != null) {
        return -1; // A 有排名，B 无排名，A 排前面
      } else if (rankB != null) {
        return 1; // B 有排名，A 无排名，B 排前面
      } else {
        // 都无排名，按默认顺序
        return (a['order'] as int).compareTo(b['order'] as int);
      }
    });

    return Column(
      children: availableModes.map((mode) {
        final modeId = mode['id'] as String;
        final modeName = mode['name'] as String;
        final modeIcon = mode['icon'] as IconData;
        final statsJson = mode['json'] as String;

        final stats = jsonDecode(statsJson) as Map<String, dynamic>;

        // 构造显示用的统计数据对象
        final displayStats = _parseStats(stats);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildModeCard(
            context,
            modeId,
            modeName,
            modeIcon,
            displayStats,
          ),
        );
      }).toList(),
    );
  }

  // 解析 JSON 统计数据
  _DisplayStats _parseStats(Map<String, dynamic> stats) {
    final pp = (stats['pp'] as num?)?.toDouble();
    final hitAccuracy = (stats['hit_accuracy'] as num?)?.toDouble();
    final globalRank = stats.containsKey('rank')
        ? (stats['rank'] as Map<String, dynamic>)['global'] as int?
        : stats['global_rank'] as int?;

    int? currentLevel;
    int? levelProgress;

    if (stats.containsKey('level')) {
      final level = stats['level'] as Map<String, dynamic>;
      currentLevel = level['current'] as int?;
      levelProgress = level['progress'] as int?;
    }

    return _DisplayStats(
      pp: pp,
      hitAccuracy: hitAccuracy,
      globalRank: globalRank,
      currentLevel: currentLevel,
      levelProgress: levelProgress,
    );
  }

  // 从 OsuUser 对象提取当前主模式数据 (fallback)
  _DisplayStats _extractStats(OsuUser user) {
    return _DisplayStats(
      pp: user.pp,
      hitAccuracy: user.hitAccuracy,
      globalRank: user.globalRank,
      currentLevel: user.currentLevel,
      levelProgress: user.levelProgress,
    );
  }

  Widget _buildModeCard(
    BuildContext context,
    String modeId,
    String modeName,
    IconData modeIcon,
    _DisplayStats stats,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 背景图 (Cover)
          if (user.coverUrl != null)
            Positioned.fill(
              child: Image.network(
                user.coverUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: Colors.grey.shade800),
              ),
            ),

          // 遮罩层 - 使用不同颜色区分模式，或者统一黑色半透明
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _getModeColor(modeId).withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // 模式图标
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(modeIcon, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                user.username,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (user.countryCode != null) ...[
                                const SizedBox(width: 8),
                                _buildCountryFlag(user.countryCode!),
                              ],
                            ],
                          ),
                          Text(
                            modeName,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Supporter 标
                    if (user.isSupporter)
                      const Icon(
                        Icons.favorite,
                        color: Colors.pinkAccent,
                        size: 16,
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // 统计信息概览
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                      'PP',
                      '${stats.pp?.toStringAsFixed(0) ?? "-"}',
                    ),
                    _buildStatItem('Rank', '#${stats.globalRank ?? "-"}'),
                    _buildStatItem(
                      'Acc',
                      '${stats.hitAccuracy?.toStringAsFixed(2) ?? "-"}%',
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // 等级进度条
                if (stats.currentLevel != null &&
                    stats.levelProgress != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lv.${stats.currentLevel}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${stats.levelProgress}%',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: (stats.levelProgress ?? 0) / 100,
                    backgroundColor: Colors.white12,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getModeColor(modeId),
                    ),
                    minHeight: 4,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 仅用于 fallback 的简单卡片构建
  Widget _buildSingleCard(
    BuildContext context,
    String username,
    String mode,
    _DisplayStats stats,
  ) {
    return _buildModeCard(context, mode, mode, Icons.circle_outlined, stats);
  }

  Color _getModeColor(String mode) {
    switch (mode) {
      case 'osu':
        return Colors.pinkAccent;
      case 'taiko':
        return Colors.teal;
      case 'fruits':
        return Colors.orange; // catch
      case 'mania':
        return Colors.purpleAccent;
      default:
        return Colors.pinkAccent;
    }
  }

  Widget _buildCountryFlag(String countryCode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        countryCode,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
      ],
    );
  }
}

class _DisplayStats {
  final double? pp;
  final double? hitAccuracy;
  final int? globalRank;
  final int? currentLevel;
  final int? levelProgress;

  _DisplayStats({
    this.pp,
    this.hitAccuracy,
    this.globalRank,
    this.currentLevel,
    this.levelProgress,
  });
}
