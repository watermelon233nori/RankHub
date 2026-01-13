import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/models/divingfish/divingfish_score.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';

/// 水鱼查分器 - 紧凑型成绩卡片
class DivingFishCompactScoreCard extends StatelessWidget {
  final DivingFishScore score;
  final int? rank; // 可选的排名显示

  const DivingFishCompactScoreCard(this.score, {super.key, this.rank});

  /// 获取难度颜色
  Color _getLevelColor(int levelIndex) {
    final level = LevelIndex.fromValue(levelIndex);
    switch (level) {
      case LevelIndex.basic:
        return const Color(0xFF22BB5B);
      case LevelIndex.advanced:
        return const Color(0xFFFF9900);
      case LevelIndex.expert:
        return const Color(0xFFEE0000);
      case LevelIndex.master:
        return const Color(0xFFBB33EE);
      case LevelIndex.reMaster:
        return const Color(0xFFDDAAFF);
    }
  }

  /// 获取谱面类型颜色
  Color _getTypeColor(String type) {
    switch (type.toUpperCase()) {
      case 'SD':
        return const Color.fromARGB(255, 7, 102, 245);
      case 'DX':
        return const Color.fromARGB(255, 224, 193, 23);
      default:
        return Colors.grey;
    }
  }

  /// 获取 FC 颜色
  Color? _getFcColor(String fc) {
    if (fc.isEmpty) return null;
    switch (fc.toLowerCase()) {
      case 'fc':
        return const Color.fromARGB(255, 49, 202, 151);
      case 'fcp':
        return const Color(0xFF4CAF50);
      case 'ap':
        return const Color(0xFFFF9800);
      case 'app':
        return const Color(0xFFFF5722);
      default:
        return null;
    }
  }

  /// 获取 FS 颜色
  Color? _getFsColor(String fs) {
    if (fs.isEmpty) return null;
    switch (fs.toLowerCase()) {
      case 'fs':
        return const Color(0xFF03A9F4);
      case 'fsp':
        return const Color.fromARGB(255, 25, 50, 196);
      case 'fsd':
        return const Color(0xFFE91E63);
      case 'fsdp':
        return const Color(0xFFF44336);
      case 'sync':
        return const Color.fromARGB(255, 92, 129, 147);
      default:
        return null;
    }
  }

  /// 格式化 FC/FS 标签显示
  String _formatBadgeLabel(String badge) {
    if (badge.isEmpty) return '';
    final upper = badge.toUpperCase();
    switch (upper) {
      case 'FCP':
        return 'FC+';
      case 'APP':
        return 'AP+';
      case 'FSP':
        return 'FS+';
      default:
        return upper;
    }
  }

  @override
  Widget build(BuildContext context) {
    final achievementStr = score.achievements.toStringAsFixed(4);
    final parts = achievementStr.split('.');
    final intPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '0';
    final coverId = score.songId.toString().padLeft(5, '0');

    final imageUrl = "https://www.diving-fish.com/covers/$coverId.png";
    final levelColor = _getLevelColor(score.levelIndex);
    final typeColor = _getTypeColor(score.type);
    final fcColor = _getFcColor(score.fc);
    final fsColor = _getFsColor(score.fs);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          // TODO: 跳转到曲目详情页
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 封面图
              SizedBox(
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.music_note,
                      size: 32,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              // 内容区域
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 第一行：曲名 + Rating
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              score.title,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              score.ra.toString(),
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // 第二行：难度 + 类型 + 达成率
                      Row(
                        children: [
                          // 难度
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: levelColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              "${score.levelLabel} ${score.level}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          // 类型
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: typeColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              score.type.toUpperCase() == 'SD' ? '标准' : 'DX',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // 达成率
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: intPart,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '.$decimalPart%',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // 第三行：FC/FS 徽章
                      Row(
                        children: [
                          if (score.fc.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: fcColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                _formatBadgeLabel(score.fc),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (score.fc.isNotEmpty && score.fs.isNotEmpty)
                            const SizedBox(width: 4),
                          if (score.fs.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: fsColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                _formatBadgeLabel(score.fs),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          const Spacer(),
                          // DX Score
                          Text(
                            "DX: ${score.dxScore}",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
