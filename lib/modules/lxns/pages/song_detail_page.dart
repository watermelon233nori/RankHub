import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/models/maimai/song.dart';
import '../widgets/difficulty_card.dart';
import '../widgets/song_info_tab.dart';

/// 乐曲详情页面
class SongDetailPage extends StatefulWidget {
  final Song song;

  const SongDetailPage({super.key, required this.song});

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  double _titleOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (!context.mounted) return;
      setState(() {
        _titleOpacity = ((_scrollController.offset - 178) / 72).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            // AppBar with cover image
            SliverAppBar(
              primary: true,
              titleSpacing: 0,
              stretch: true,
              forceElevated: true,
              centerTitle: false,
              backgroundColor: colorScheme.surface.withOpacity(0.95),
              surfaceTintColor: Colors.transparent,
              title: Opacity(
                opacity: _titleOpacity,
                child: ListTile(
                  visualDensity: VisualDensity.compact,
                  isThreeLine: false,
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://assets2.lxns.net/maimai/jacket/${widget.song.songId}.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 500),
                      placeholder: (context, url) => Transform.scale(
                        scale: 0.4,
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                  title: Text(
                    widget.song.title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: Text(
                    widget.song.artist,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: _shareSong,
                  icon: const Icon(Icons.share),
                ),
                const SizedBox(width: 8),
              ],
              expandedHeight: 300.0,
              pinned: true,
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  FlexibleSpaceBar(
                    stretchModes: const [StretchMode.blurBackground],
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // 背景图片
                        GestureDetector(
                          onTap: _showCoverImage,
                          child: Opacity(
                            opacity: 0.5,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://assets2.lxns.net/maimai/jacket/${widget.song.songId}.png',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                        // 前景内容
                        _buildExtendedContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Tab Bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: '曲目信息'),
                    Tab(text: '谱面信息'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // 曲目信息
            SongInfoTab(song: widget.song),
            // 谱面信息
            _buildDifficultiesTab(),
          ],
        ),
      ),
    );
  }

  /// 构建扩展内容（标题、艺术家等）
  Widget _buildExtendedContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 标题
          Text(
            widget.song.title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          // 艺术家
          Text(
            widget.song.artist,
            style: const TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// 构建谱面信息标签页
  Widget _buildDifficultiesTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "点击卡片即可查看详细信息",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 标准谱面
          if (widget.song.difficulties.standard.isNotEmpty) ...[
            for (
              int i = widget.song.difficulties.standard.length - 1;
              i >= 0;
              i--
            )
              DifficultyCard(
                difficulty: widget.song.difficulties.standard[i],
                songId: widget.song.songId,
                songName: widget.song.title,
              ),
          ],
          // DX 谱面
          if (widget.song.difficulties.dx.isNotEmpty) ...[
            for (int i = widget.song.difficulties.dx.length - 1; i >= 0; i--)
              DifficultyCard(
                difficulty: widget.song.difficulties.dx[i],
                songId: widget.song.songId,
                songName: widget.song.title,
              ),
          ],
          // 宴会场谱面
          if (widget.song.difficulties.utage.isNotEmpty) ...[
            for (int i = widget.song.difficulties.utage.length - 1; i >= 0; i--)
              DifficultyCard(
                difficulty: widget.song.difficulties.utage[i],
                songId: widget.song.songId,
                songName: widget.song.title,
                isUtage: true,
              ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// 分享乐曲
  void _shareSong() {
    // TODO: 实现分享功能
    Get.snackbar('提示', '分享功能开发中', snackPosition: SnackPosition.BOTTOM);
  }

  /// 显示封面大图
  void _showCoverImage() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: InteractiveViewer(
            child: CachedNetworkImage(
              imageUrl:
                  'https://assets2.lxns.net/maimai/jacket/${widget.song.songId}.png',
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
        ),
      ),
    );
  }
}

/// Tab Bar 的 SliverPersistentHeaderDelegate
class _SliverTabDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
          child: _tabBar,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverTabDelegate oldDelegate) {
    return false;
  }
}
