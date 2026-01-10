import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap_detail.dart';
import 'package:rank_hub/modules/osu/services/sayobot_api_service.dart';
import 'package:rank_hub/modules/osu/widgets/osu_radar_chart.dart';
import 'package:rank_hub/modules/osu/services/beatmap_preview_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class OsuBeatmapDetailPage extends StatefulWidget {
  final int sid;
  final String? coverUrl;
  final String? title;
  final String? artist;

  const OsuBeatmapDetailPage({
    super.key,
    required this.sid,
    this.coverUrl,
    this.title,
    this.artist,
  });

  @override
  State<OsuBeatmapDetailPage> createState() => _OsuBeatmapDetailPageState();
}

class _OsuBeatmapDetailPageState extends State<OsuBeatmapDetailPage>
    with TickerProviderStateMixin {
  final SayobotApiService _apiService = SayobotApiService();
  late Future<SayobotBeatmapDetail> _detailFuture;

  // State for selected difficulty
  SayobotBeatmapDifficulty? _selectedDifficulty;
  int _selectedMode = -1; // -1 means not set yet
  bool _isPlaying = false;
  bool _isDownloadingPreview = false;

  @override
  void initState() {
    super.initState();
    _detailFuture = _apiService.getBeatmapDetail(widget.sid);
  }

  @override
  void dispose() {
    if (BeatmapPreviewManager.isPlaying(widget.sid)) {
      BeatmapPreviewManager.stop();
    }
    super.dispose();
  }

  Future<void> _togglePreview(SayobotBeatmapDetail detail) async {
    if (_isPlaying) {
      await BeatmapPreviewManager.stop();
      if (mounted) setState(() => _isPlaying = false);
    } else {
      // Sayobot preview URL logic
      final previewUrl =
          'https://cdn.sayobot.cn:25225/preview/${detail.sid}.mp3';

      setState(() => _isDownloadingPreview = true);
      try {
        await BeatmapPreviewManager.play(detail.sid, previewUrl, () {
          if (mounted) setState(() => _isPlaying = false);
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<SayobotBeatmapDetail>(
        future: _detailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          }
          if (snapshot.hasError) {
            return _buildError(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return _buildError('无数据');
          }

          final detail = snapshot.data!;

          // Initialize selection if needed
          if (_selectedDifficulty == null && detail.bidData.isNotEmpty) {
            // Default to first difficulty
            _selectedDifficulty = detail.bidData.first;
            _selectedMode = _selectedDifficulty!.mode;
          }

          return _buildContent(detail);
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Stack(
      children: [
        _buildBackground(widget.coverUrl ?? ''),
        const Center(child: CircularProgressIndicator(color: Colors.white)),
      ],
    );
  }

  Widget _buildError(String error) {
    return Stack(
      children: [
        _buildBackground(widget.coverUrl ?? ''),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 48),
              const SizedBox(height: 16),
              Text(
                error,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground(String url) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (url.isNotEmpty)
          CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => Container(color: Colors.black),
          )
        else
          Container(color: Colors.black),
        // Blur effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }

  Widget _buildContent(SayobotBeatmapDetail detail) {
    // Group difficulties by mode
    final Map<int, List<SayobotBeatmapDifficulty>> modeDiffs = {};
    for (var diff in detail.bidData) {
      modeDiffs.putIfAbsent(diff.mode, () => []).add(diff);
    }

    // Sort difficulties by stars
    for (var list in modeDiffs.values) {
      list.sort((a, b) => a.star.compareTo(b.star));
    }

    // Available modes
    final availableModes = modeDiffs.keys.toList()..sort();

    // Ensure selected mode is valid
    if (!availableModes.contains(_selectedMode) && availableModes.isNotEmpty) {
      _selectedMode = availableModes.first;
      _selectedDifficulty = modeDiffs[_selectedMode]!.first;
    }

    return Stack(
      children: [
        // Background
        _buildBackground(detail.coverUrl),

        // Content
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Info
              _buildHeader(detail),

              // Mode Selector (if multiple modes)
              if (availableModes.length > 1)
                _buildModeSelector(availableModes, modeDiffs),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left: Difficulty List
                    SizedBox(
                      width: 120,
                      child: _buildDifficultyList(
                        modeDiffs[_selectedMode] ?? [],
                      ),
                    ),

                    // Right: Detailed Stats
                    Expanded(
                      child: _selectedDifficulty != null
                          ? _buildDifficultyDetail(_selectedDifficulty!)
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),

              // Bottom Actions
              _buildBottomActions(detail),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(SayobotBeatmapDetail detail) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Cover Image
          Hero(
            tag: 'beatmap_cover_${detail.sid}',
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(detail.coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _togglePreview(detail),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: _isDownloadingPreview
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
                                size: 24,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.preferredTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  detail.preferredArtist,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mapset by ${detail.creator}',
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTag('BPM: ${detail.bpm}'),
                    const SizedBox(width: 8),
                    _buildTag('SID: ${detail.sid}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildModeSelector(
    List<int> modes,
    Map<int, List<SayobotBeatmapDifficulty>> modeDiffs,
  ) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: modes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final mode = modes[index];
          final isSelected = mode == _selectedMode;
          return ChoiceChip(
            label: Text(_getModeName(mode)),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedMode = mode;
                  // Explicitly update difficulty to the first one of the new mode
                  // This prevents FutureBuilder/buildContent from resetting it back to default
                  final diffs = modeDiffs[mode];
                  if (diffs != null && diffs.isNotEmpty) {
                    _selectedDifficulty = diffs.first;
                  }
                });
              }
            },
            backgroundColor: Colors.black26,
            selectedColor: Colors.pinkAccent,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
            ),
            side: BorderSide.none,
          );
        },
      ),
    );
  }

  String _getModeName(int mode) {
    switch (mode) {
      case 0:
        return 'osu!';
      case 1:
        return 'Taiko';
      case 2:
        return 'Catch';
      case 3:
        return 'Mania';
      default:
        return 'Mode $mode';
    }
  }

  Widget _buildDifficultyList(List<SayobotBeatmapDifficulty> diffs) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: diffs.length,
      itemBuilder: (context, index) {
        final diff = diffs[index];
        final isSelected = diff == _selectedDifficulty;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDifficulty = diff;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.pinkAccent.withOpacity(0.8)
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: Colors.white, width: 1)
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  diff.version,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: Colors.yellow),
                    Text(
                      ' ${diff.star.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDifficultyDetail(SayobotBeatmapDifficulty diff) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Radar Chart
          SizedBox(
            height: 200,
            child: OsuRadarChart(
              hp: diff.hp,
              od: diff.od,
              cs: diff.cs,
              ar: diff.ar,
              length: diff.length.toDouble(),
              color: Colors.pinkAccent,
              showLength: true,
            ),
          ),
          const SizedBox(height: 24),

          // Stats Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio:
                2.0, // Reduced aspect ratio to increase height (was 2.4)
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              _buildStatItem('Max Combo', '${diff.maxCombo}x'),
              _buildStatItem('PP (Max)', diff.pp.toStringAsFixed(0)),
              _buildStatItem('Circles', '${diff.circles}'),
              _buildStatItem('Sliders', '${diff.sliders}'),
              _buildStatItem('Spinners', '${diff.spinners}'),
              _buildStatItem('Length', '${diff.length}s'),
              _buildStatItem('Pass Count', '${diff.passCount}'),
              _buildStatItem('Play Count', '${diff.playCount}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(SayobotBeatmapDetail detail) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () async {
                final url = Uri.parse(
                  'https://dl.sayobot.cn/beatmaps/download/full/${detail.sid}',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              icon: const Icon(Icons.download),
              label: const Text('下载铺面'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () async {
                final url = Uri.parse(
                  'https://sayobot.cn/beatmap/${detail.sid}',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              icon: const Icon(Icons.open_in_browser),
              label: const Text('在 Sayobot 打开'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
