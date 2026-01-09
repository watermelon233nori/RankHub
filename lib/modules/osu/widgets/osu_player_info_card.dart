import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/osu/osu_user.dart';
import 'package:rank_hub/modules/osu/pages/osu_mode_detail_page.dart';
import 'package:rank_hub/modules/osu/services/osu_login_handler.dart';

class OsuPlayerInfoCard extends StatelessWidget {
  final OsuUser user;

  const OsuPlayerInfoCard({super.key, required this.user});

  // 将 ISO 国家代码转换为 Emoji 旗帜
  String _getCountryFlag(String countryCode) {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String firstChar = String.fromCharCode(
      flagOffset + countryCode.codeUnitAt(0) - asciiOffset,
    );
    String secondChar = String.fromCharCode(
      flagOffset + countryCode.codeUnitAt(1) - asciiOffset,
    );

    return firstChar + secondChar;
  }

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

    // 3. 排序逻辑：按 PP 从大到小（越高越好）
    availableModes.sort((a, b) {
      final statsA = _parseStats(
        jsonDecode(a['json'] as String) as Map<String, dynamic>,
      );
      final statsB = _parseStats(
        jsonDecode(b['json'] as String) as Map<String, dynamic>,
      );

      final ppA = statsA.pp;
      final ppB = statsB.pp;

      if (ppA != null && ppB != null) {
        return ppB.compareTo(ppA); // Descending
      } else if (ppA != null) {
        return -1; // A 有 PP，B 无 PP，A 排前面
      } else if (ppB != null) {
        return 1; // B 有 PP，A 无 PP，B 排前面
      } else {
        return (a['order'] as int).compareTo(b['order'] as int);
      }
    });

    // 4. 过滤逻辑：隐藏数据为空（例如 PP 为 0 或 null）的模式
    final displayModes = availableModes.where((m) {
      final stats = _parseStats(
        jsonDecode(m['json'] as String) as Map<String, dynamic>,
      );
      return stats.pp != null && stats.pp! > 0;
    }).toList();

    return Column(
      children: [
        // 顶部用户信息卡片 (头像、用户名、ID、国旗、刷新按钮)
        _buildUserInfoHeader(context),

        const SizedBox(height: 12),

        // 各模式数据卡片列表
        if (displayModes.isEmpty)
          // Fallback: 如果没有有效数据，显示默认模式的空数据
          _buildModeCard(
            context,
            'osu',
            'osu!',
            Icons.circle_outlined,
            _extractStats(user),
            null, // No detailed stats available
          )
        else
          ...displayModes.map((mode) {
            final modeId = mode['id'] as String;
            final modeName = mode['name'] as String;
            final modeIcon = mode['icon'] as IconData;
            final statsJson = mode['json'] as String;
            final statsMap = jsonDecode(statsJson) as Map<String, dynamic>;
            final displayStats = _parseStats(statsMap);

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildModeCard(
                context,
                modeId,
                modeName,
                modeIcon,
                displayStats,
                statsMap, // Pass full stats map for detail page
              ),
            );
          }),
      ],
    );
  }

  // 构建顶部用户信息头部
  Widget _buildUserInfoHeader(BuildContext context) {
    final joinDateStr = user.joinDate != null
        ? DateFormat('yyyy-MM-dd').format(user.joinDate!)
        : 'Unknown';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 头像
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                image: user.avatarUrl != null
                    ? DecorationImage(
                        image: NetworkImage(user.avatarUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: user.avatarUrl == null
                  ? const Icon(Icons.person, size: 30)
                  : null,
            ),
            const SizedBox(width: 16),

            // 用户信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        user.username,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (user.countryCode != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          _getCountryFlag(user.countryCode!),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                      if (user.isSupporter) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.favorite,
                          color: Colors.pinkAccent,
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (user.countryName != null)
                        Text(
                          '${user.countryName}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      if (user.countryName != null) const SizedBox(width: 8),
                      Text(
                        'ID: ${user.userId}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Joined: $joinDateStr',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),

            // 刷新按钮
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                final account = Account(
                  platform: Platform.osu,
                  externalId: user.userId.toString(),
                  credentialType: CredentialType.oauth2,
                  displayName: user.username,
                  avatarUrl: user.avatarUrl,
                );
                OsuLoginHandler().refreshUser(account);
              },
              tooltip: 'Refresh Data',
            ),
          ],
        ),
      ),
    );
  }

  // 解析 JSON 统计数据
  _DisplayStats _parseStats(Map<String, dynamic> stats) {
    final pp = (stats['pp'] as num?)?.toDouble();
    final hitAccuracy = (stats['hit_accuracy'] as num?)?.toDouble();

    // 修复 Global Rank 获取逻辑：优先使用 global_rank，其次尝试 rank.global
    int? globalRank = stats['global_rank'] as int?;
    if (globalRank == null && stats.containsKey('rank')) {
      final rankData = stats['rank'];
      if (rankData is Map<String, dynamic>) {
        globalRank = rankData['global'] as int?;
      }
    }

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
    Map<String, dynamic>? fullStats,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: fullStats != null
            ? () {
                Get.to(
                  () => OsuModeDetailPage(
                    modeName: modeName,
                    modeId: modeId,
                    stats: fullStats,
                    username: user.username,
                    avatarUrl: user.avatarUrl,
                  ),
                );
              }
            : null,
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

            // 遮罩层 - 使用不同颜色区分模式
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _getModeColor(modeId).withOpacity(0.6),
                      Colors.black.withOpacity(0.9),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(
                        modeName.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.chevron_right, color: Colors.white70),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 统计信息概览
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('PP', stats.pp?.toStringAsFixed(0) ?? "-"),
                      _buildStatItem(
                        'Global Rank',
                        '#${stats.globalRank ?? "-"}',
                      ),
                      _buildStatItem(
                        'Accuracy',
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
      ),
    );
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
