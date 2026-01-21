import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rank_hub/modules/osu/pages/osu_beatmap_detail_page.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap.dart';
import 'package:rank_hub/modules/osu/services/beatmap_preview_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class OsuBeatmapCard extends StatefulWidget {
  final SayobotBeatmap beatmap;

  const OsuBeatmapCard({super.key, required this.beatmap});

  @override
  State<OsuBeatmapCard> createState() => _OsuBeatmapCardState();
}

class _OsuBeatmapCardState extends State<OsuBeatmapCard> {
  bool _isPlaying = false;
  bool _isDownloadingPreview = false;

  @override
  void dispose() {
    if (BeatmapPreviewManager.isPlaying(widget.beatmap.sid)) {
      BeatmapPreviewManager.stop();
    }
    super.dispose();
  }

  Future<void> _togglePreview() async {
    if (_isPlaying) {
      await BeatmapPreviewManager.stop();
      if (mounted) setState(() => _isPlaying = false);
    } else {
      setState(() => _isDownloadingPreview = true);
      try {
        await BeatmapPreviewManager.play(
          widget.beatmap.sid,
          widget.beatmap.previewUrl,
          () {
            if (mounted) setState(() => _isPlaying = false);
          },
        );
        if (mounted) setState(() => _isPlaying = true);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('试听播放失败: $e')));
        }
      } finally {
        if (mounted) setState(() => _isDownloadingPreview = false);
      }
    }
  }

  Future<void> _downloadBeatmap() async {
    final url = Uri.parse(widget.beatmap.downloadUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('无法打开下载链接')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OsuBeatmapDetailPage(
                sid: widget.beatmap.sid,
                coverUrl: widget.beatmap.coverUrl,
                title: widget.beatmap.preferredTitle,
                artist: widget.beatmap.preferredArtist,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            // 背景图
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: widget.beatmap.coverUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: colorScheme.surfaceContainerHighest),
                errorWidget: (context, url, error) => Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: const Icon(Icons.broken_image),
                ),
              ),
            ),
            // 渐变遮罩
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
            // 内容
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 顶部状态标签
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusChip(colorScheme),
                      Row(
                        children: [
                          const Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.beatmap.playCount.toString(),
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.beatmap.favouriteCount.toString(),
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(), // 占据中间空间，把内容推到底部
                  // 标题
                  Text(
                    widget.beatmap.preferredTitle,
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // 创作者信息
                  Text(
                    '创作者: ${widget.beatmap.creator}',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                  ),
                  Text(
                    '艺术家: ${widget.beatmap.preferredArtist}',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  // 底部操作栏
                  Row(
                    children: [
                      // 模式图标
                      if (widget.beatmap.modes & 1 != 0)
                        _buildModeIcon(Icons.circle_outlined, 1, 'Standard'),
                      if (widget.beatmap.modes & 2 != 0)
                        _buildModeIcon(Icons.adjust, 2, 'Taiko'),
                      if (widget.beatmap.modes & 4 != 0)
                        _buildModeIcon(Icons.catching_pokemon, 4, 'Catch'),
                      if (widget.beatmap.modes & 8 != 0)
                        _buildModeIcon(Icons.piano, 8, 'Mania'),

                      const Spacer(),

                      // 试听按钮
                      IconButton(
                        onPressed: _togglePreview,
                        icon: _isDownloadingPreview
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                _isPlaying ? Icons.stop : Icons.play_arrow,
                                color: Colors.white,
                              ),
                        tooltip: _isPlaying ? '停止试听' : '试听预览',
                      ),

                      // 下载按钮
                      IconButton(
                        onPressed: _downloadBeatmap,
                        icon: const Icon(
                          Icons.cloud_download,
                          color: Colors.white,
                        ),
                        tooltip: '下载铺面',
                      ),

                      // 详情链接（如果有详情页的话，暂时留空或用外部链接）
                      IconButton(
                        onPressed: () async {
                          final url = Uri.parse(
                            'https://sayobot.cn/beatmap/${widget.beatmap.sid}',
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.open_in_new,
                          color: Colors.white,
                        ),
                        tooltip: '在 Sayobot 查看',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(ColorScheme colorScheme) {
    String label;
    Color color;

    // 状态判断
    if (widget.beatmap.approved == 1) {
      label = 'RANKED';
      color = Colors.blue;
    } else if (widget.beatmap.approved == 2) {
      label = 'APPROVED';
      color = Colors.green;
    } else if (widget.beatmap.approved == 3) {
      label = 'QUALIFIED';
      color = Colors.lightBlueAccent;
    } else if (widget.beatmap.approved == 4) {
      label = 'LOVED';
      color = Colors.pinkAccent;
    } else if (widget.beatmap.approved == -2) {
      // Graveyard
      label = 'GRAVEYARD';
      color = Colors.grey;
    } else if (widget.beatmap.approved == -1) {
      // WIP
      label = 'WIP';
      color = Colors.orange;
    } else {
      label = 'PENDING';
      color = Colors.orangeAccent;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildModeIcon(IconData icon, int mode, String tooltip) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Tooltip(
        message: '$tooltip 模式',
        child: Icon(icon, color: Colors.pinkAccent, size: 20),
      ),
    );
  }
}
