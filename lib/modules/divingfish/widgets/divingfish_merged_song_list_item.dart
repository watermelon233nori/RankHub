import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/models/divingfish/divingfish_merged_song.dart';
import 'package:rank_hub/models/divingfish/divingfish_song.dart';

/// 水鱼查分器合并曲目列表项（显示 SD 和 DX 版本）
class DivingFishMergedSongListItem extends StatelessWidget {
  final DivingFishMergedSong mergedSong;

  const DivingFishMergedSongListItem({super.key, required this.mergedSong});

  /// 获取难度颜色
  Color _getDifficultyColor(int index) {
    switch (index) {
      case 0: // Basic
        return Colors.green;
      case 1: // Advanced
        return Colors.yellow.shade700;
      case 2: // Expert
        return Colors.red;
      case 3: // Master
        return Colors.purple;
      case 4: // Re:Master
        return Colors.purple.shade200;
      default:
        return Colors.grey;
    }
  }

  /// 构建单个版本的难度芯片
  Widget _buildVersionDifficultyChips(
    BuildContext context,
    DivingFishSong song,
    String versionLabel,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<Widget> chips = [];

    // 版本标签
    chips.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          versionLabel,
          style: TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    chips.add(const SizedBox(width: 6));

    // 难度芯片
    for (int i = 0; i < song.level.length; i++) {
      chips.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: _getDifficultyColor(i),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            song.level[i],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      if (i < song.level.length - 1) {
        chips.add(const SizedBox(width: 3));
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: chips);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final basicInfo = mergedSong.basicInfo;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // TODO: 导航到曲目详情页
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 左侧曲绘
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: (mergedSong.dxVersion ?? mergedSong.sdVersion)!
                      .getCoverUrl(),
                  width: 56,
                  height: 56,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  placeholder: (context, url) => Container(
                    width: 56,
                    height: 56,
                    color: colorScheme.primaryContainer,
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (mergedSong.hasBothVersions)
                          Text(
                            'SD+DX',
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else if (mergedSong.hasOnlySD)
                          Text(
                            'SD',
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else
                          Text(
                            'DX',
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (basicInfo?.bpm != null && basicInfo!.bpm > 0)
                          Text(
                            '${basicInfo.bpm}',
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontSize: 9,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // 右侧内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 曲名
                    Text(
                      mergedSong.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // 艺术家和流派
                    if (basicInfo != null)
                      Text(
                        basicInfo.artist,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 8),

                    // 难度芯片（使用竖线分隔 SD 和 DX）
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        // SD 版本难度
                        if (mergedSong.sdVersion != null)
                          _buildVersionDifficultyChips(
                            context,
                            mergedSong.sdVersion!,
                            'SD',
                          ),

                        // 分隔符
                        if (mergedSong.sdVersion != null &&
                            mergedSong.dxVersion != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: const Text(
                              '|',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        // DX 版本难度
                        if (mergedSong.dxVersion != null)
                          _buildVersionDifficultyChips(
                            context,
                            mergedSong.dxVersion!,
                            'DX',
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
