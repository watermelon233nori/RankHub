import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/models/divingfish/divingfish_song.dart';

/// 水鱼查分器曲目列表项
class DivingFishSongListItem extends StatelessWidget {
  final DivingFishSong song;

  const DivingFishSongListItem({super.key, required this.song});

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

  /// 构建难度芯片列表
  List<Widget> _buildDifficultyChips() {
    final List<Widget> chips = [];

    for (int i = 0; i < song.level.length; i++) {
      chips.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: _getDifficultyColor(i),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            song.level[i],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      if (i < song.level.length - 1) {
        chips.add(const SizedBox(width: 4));
      }
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final basicInfo = song.basicInfo;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: song.getCoverUrl(),
            width: 50,
            height: 50,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            placeholder: (context, url) => Container(
              width: 50,
              height: 50,
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
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  song.type,
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          song.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            if (basicInfo?.artist != null)
              Text(
                basicInfo!.artist,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (basicInfo?.genre != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      basicInfo!.genre,
                      style: TextStyle(
                        color: colorScheme.onSecondaryContainer,
                        fontSize: 10,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                if (basicInfo?.isNew == true)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Wrap(spacing: 4, runSpacing: 4, children: _buildDifficultyChips()),
          ],
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: colorScheme.onSurfaceVariant,
        ),
        onTap: () {
          // TODO: 导航到曲目详情页
          _showSongDetails(context);
        },
      ),
    );
  }

  /// 显示曲目详情
  void _showSongDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 曲绘
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: song.getCoverUrl(),
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        placeholder: (context, url) => Container(
                          width: 200,
                          height: 200,
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 200,
                          height: 200,
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          child: const Center(
                            child: Icon(Icons.music_note, size: 64),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 标题
                  Text(
                    song.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  if (song.basicInfo?.artist != null)
                    Text(
                      song.basicInfo!.artist,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  const SizedBox(height: 16),

                  // 基本信息
                  _buildInfoCard(context, '基本信息', [
                    if (song.basicInfo?.genre != null)
                      _buildInfoRow('分类', song.basicInfo!.genre),
                    if (song.basicInfo?.bpm != null)
                      _buildInfoRow('BPM', '${song.basicInfo!.bpm}'),
                    _buildInfoRow('类型', song.type),
                    if (song.basicInfo?.from != null)
                      _buildInfoRow('版本', song.basicInfo!.from),
                  ]),

                  const SizedBox(height: 16),

                  // 难度信息
                  _buildInfoCard(context, '难度信息', [
                    for (int i = 0; i < song.level.length; i++)
                      _buildDifficultyRow(context, i),
                  ]),

                  const SizedBox(height: 16),

                  // 谱面信息
                  if (song.charts.isNotEmpty)
                    _buildInfoCard(context, '谱面信息', [
                      for (int i = 0; i < song.charts.length; i++)
                        _buildChartRow(context, i),
                    ]),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDifficultyRow(BuildContext context, int index) {
    const difficultyNames = [
      'Basic',
      'Advanced',
      'Expert',
      'Master',
      'Re:Master',
    ];
    if (index >= difficultyNames.length) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getDifficultyColor(index),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  difficultyNames[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 8),
              Text(song.level[index]),
            ],
          ),
          if (index < song.ds.length)
            Text(
              '${song.ds[index]}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Widget _buildChartRow(BuildContext context, int index) {
    const difficultyNames = [
      'Basic',
      'Advanced',
      'Expert',
      'Master',
      'Re:Master',
    ];
    if (index >= song.charts.length || index >= difficultyNames.length) {
      return const SizedBox.shrink();
    }

    final chart = song.charts[index];
    final noteLabels = song.type == 'DX'
        ? ['Tap', 'Hold', 'Slide', 'Touch', 'Break']
        : ['Tap', 'Hold', 'Slide', 'Break'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getDifficultyColor(index),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              difficultyNames[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (chart.charter.isNotEmpty)
            Text('谱师: ${chart.charter}', style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            children: [
              for (
                int i = 0;
                i < chart.notes.length && i < noteLabels.length;
                i++
              )
                Text(
                  '${noteLabels[i]}: ${chart.notes[i]}',
                  style: const TextStyle(fontSize: 11),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
