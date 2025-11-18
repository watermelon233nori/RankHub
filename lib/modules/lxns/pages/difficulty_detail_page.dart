import 'package:flutter/material.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../widgets/note_table.dart';

/// 谱面详情页面
class DifficultyDetailPage extends StatefulWidget {
  final dynamic difficulty; // SongDifficulty or SongDifficultyUtage
  final String songName;

  const DifficultyDetailPage({
    super.key,
    required this.difficulty,
    required this.songName,
  });

  @override
  State<DifficultyDetailPage> createState() => _DifficultyDetailPageState();
}

class _DifficultyDetailPageState extends State<DifficultyDetailPage> {
  int _calculateMode = 0; // 0: 绝对值, 1: CRITICAL差值, 2: PERFECT差值
  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final difficultyColor = _getDifficultyColor();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.songName, style: const TextStyle(fontSize: 16)),
            Text(
              '${widget.difficulty.difficulty.label} ${widget.difficulty.level}',
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        backgroundColor: difficultyColor.withAlpha(80),
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: widget.difficulty.notes == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 64,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无物量数据',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 基本信息卡片
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '谱面信息',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            _buildInfoRow(
                              '难度',
                              widget.difficulty.difficulty.label,
                            ),
                            const Divider(height: 24),
                            _buildInfoRow(
                              '定数',
                              widget.difficulty.levelValue.toStringAsFixed(1),
                            ),
                            const Divider(height: 24),
                            _buildInfoRow('谱师', widget.difficulty.noteDesigner),
                            const Divider(height: 24),
                            _buildInfoRow(
                              '类型',
                              widget.difficulty.type.value == 'dx'
                                  ? 'DX'
                                  : '标准',
                            ),
                            const Divider(height: 24),
                            _buildInfoRow(
                              '总物量',
                              widget.difficulty.notes!.total.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 搜索谱面确认按钮
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          final keyword =
                              '${widget.songName} ${widget.difficulty.difficulty.label} 谱面确认';
                          final url =
                              'bilibili://search?keyword=$keyword'; // 替换为目标应用的 URL Scheme
                          final Uri uri = Uri.parse(url);

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            await browser.open(
                              url: WebUri(
                                "https://search.bilibili.com/video?keyword=$keyword",
                              ),
                              settings: ChromeSafariBrowserSettings(
                                presentationStyle:
                                    ModalPresentationStyle.FORM_SHEET,
                                shareState:
                                    CustomTabsShareState.SHARE_STATE_OFF,
                                barCollapsingEnabled: true,
                              ),
                            );
                          }
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("在 哔哩哔哩 中搜索谱面确认"),
                            SizedBox(width: 8),
                            Icon(Icons.open_in_new),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 物量详情表（包含计算模式选择）
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '物量详情表',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            // 计算模式选择
                            SegmentedButton<int>(
                              segments: const [
                                ButtonSegment(
                                  value: 0,
                                  label: Text('绝对值'),
                                  icon: Icon(Icons.calculate, size: 16),
                                ),
                                ButtonSegment(
                                  value: 1,
                                  label: Text('CRITICAL差值'),
                                  icon: Icon(Icons.stars, size: 16),
                                ),
                                ButtonSegment(
                                  value: 2,
                                  label: Text('PERFECT差值'),
                                  icon: Icon(Icons.star, size: 16),
                                ),
                              ],
                              selected: {_calculateMode},
                              onSelectionChanged: (Set<int> newSelection) {
                                setState(() {
                                  _calculateMode = newSelection.first;
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 380,
                              child: NoteTable(
                                notes: widget.difficulty.notes!,
                                calculateMode: _calculateMode,
                              ),
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Color _getDifficultyColor() {
    switch (widget.difficulty.difficulty) {
      case LevelIndex.basic:
        return Colors.green;
      case LevelIndex.advanced:
        return Colors.yellow.shade700;
      case LevelIndex.expert:
        return Colors.red;
      case LevelIndex.master:
        return Colors.purple;
      case LevelIndex.reMaster:
        return Colors.purple.shade200;
      default:
        return Colors.blue;
    }
  }
}
