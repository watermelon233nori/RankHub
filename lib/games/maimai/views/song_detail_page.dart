import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/games/maimai/maimai_providers.dart';
import 'package:rank_hub/games/maimai/widgets/difficulty_card.dart';
import 'package:rank_hub/games/maimai/models/maimai_song.dart';
import 'package:rank_hub/games/maimai/widgets/song_info_tab.dart';
import 'package:share_plus/share_plus.dart';

/// 乐曲详情页面
class SongDetailPage extends ConsumerStatefulWidget {
  final int songId;

  const SongDetailPage({super.key, required this.songId});

  @override
  ConsumerState<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends ConsumerState<SongDetailPage>
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
    final song = ref.watch(maimaiSongByIdProvider(widget.songId));

    if (song == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('乐曲不存在')),
        body: const Center(child: Text('未找到该乐曲')),
      );
    }

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
                      imageUrl: song.jacketUrl,
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
                    song.title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: Text(
                    song.artist,
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
                              imageUrl: song.jacketUrl,
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
                        _buildExtendedContent(song),
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
            SongInfoTab(song: song),
            // 谱面信息
            _buildDifficultiesTab(song),
          ],
        ),
      ),
    );
  }

  /// 构建扩展内容（标题、艺术家等）
  Widget _buildExtendedContent(MaimaiSong song) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 标题
          Text(
            song.title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          // 艺术家
          Text(
            song.artist,
            style: const TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// 构建谱面信息标签页
  Widget _buildDifficultiesTab(MaimaiSong song) {
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
          if (song.difficulties.standard.isNotEmpty) ...[
            for (int i = song.difficulties.standard.length - 1; i >= 0; i--)
              DifficultyCard(
                difficulty: song.difficulties.standard[i],
                songId: song.songId,
                songName: song.title,
                version: song.versionTitle,
              ),
          ],
          // DX 谱面
          if (song.difficulties.dx.isNotEmpty) ...[
            for (int i = song.difficulties.dx.length - 1; i >= 0; i--)
              DifficultyCard(
                difficulty: song.difficulties.dx[i],
                songId: song.songId,
                songName: song.title,
                version: song.versionTitle,
              ),
          ],
          // 宴会场谱面
          if (song.difficulties.utage.isNotEmpty) ...[
            for (int i = song.difficulties.utage.length - 1; i >= 0; i--)
              DifficultyCard(
                difficulty: song.difficulties.utage[i],
                songId: song.songId,
                songName: song.title,
                version: song.versionTitle,
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
    final song = ref.read(maimaiSongByIdProvider(widget.songId));
    if (song == null) return;

    final shareUrl =
        'https://maimai.lxns.net/songs?game=maimai&song_id=${song.songId}';
    final shareText = '${song.title} - ${song.artist}\n$shareUrl';

    Share.share(
      shareText,
      subject: song.title,
      sharePositionOrigin: Rect.fromLTWH(0, 0, 1, 1),
    );
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
                  'https://assets2.lxns.net/maimai/jacket/${widget.songId}.png',
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
