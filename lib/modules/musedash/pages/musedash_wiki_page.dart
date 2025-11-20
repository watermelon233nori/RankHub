import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/musedash/musedash_controller.dart';
import 'package:rank_hub/models/musedash/musedash_music.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// MuseDash 曲库页面
class MuseDashWikiPage extends StatelessWidget {
  const MuseDashWikiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuseDashController());

    return Scaffold(
      body: Column(
        children: [
          // 搜索和筛选栏
          _buildSearchBar(controller),
          _buildFilterChips(controller),

          // 曲目列表
          Expanded(
            child: Obx(() {
              final status = controller.loadStatus;

              if (status == MuseDashDataLoadStatus.loadingFromDb ||
                  status == MuseDashDataLoadStatus.loadingFromApi) {
                return _buildLoadingView(controller);
              }

              if (status == MuseDashDataLoadStatus.error) {
                return _buildErrorView(controller);
              }

              final musicList = controller.filteredMusic;

              if (musicList.isEmpty) {
                return _buildEmptyView();
              }

              return _buildMusicList(musicList, controller);
            }),
          ),
        ],
      ),
    );
  }

  /// 搜索栏
  Widget _buildSearchBar(MuseDashController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: controller.setSearchKeyword,
        decoration: InputDecoration(
          hintText: '搜索曲名、艺术家...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Obx(() {
            if (controller.searchKeyword.isNotEmpty) {
              return IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => controller.setSearchKeyword(''),
              );
            }
            return const SizedBox.shrink();
          }),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
        ),
      ),
    );
  }

  /// 筛选芯片栏
  Widget _buildFilterChips(MuseDashController controller) {
    return SizedBox(
      height: 50,
      child: Obx(() {
        final albums = controller.albums;
        if (albums.isEmpty) return const SizedBox.shrink();

        return ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            // 全部专辑
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: const Text('全部'),
                selected: controller.selectedAlbumUid.isEmpty,
                onSelected: (_) => controller.setSelectedAlbumUid(''),
              ),
            ),

            // 专辑列表
            ...albums.map((album) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(album.title),
                  selected: controller.selectedAlbumUid == album.uid,
                  onSelected: (_) => controller.setSelectedAlbumUid(album.uid),
                ),
              );
            }),

            // 难度筛选
            const SizedBox(width: 8),
            ...List.generate(12, (index) {
              final difficulty = index + 1;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text('$difficulty+'),
                  selected: controller.selectedMinDifficulty == difficulty,
                  onSelected: (_) {
                    if (controller.selectedMinDifficulty == difficulty) {
                      controller.setSelectedMinDifficulty(0);
                    } else {
                      controller.setSelectedMinDifficulty(difficulty);
                    }
                  },
                ),
              );
            }),
          ],
        );
      }),
    );
  }

  /// 加载视图
  Widget _buildLoadingView(MuseDashController controller) {
    return Obx(() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              controller.syncDescription.isNotEmpty
                  ? controller.syncDescription
                  : '加载中...',
            ),
            if (controller.syncProgress > 0)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LinearProgressIndicator(value: controller.syncProgress),
              ),
          ],
        ),
      );
    });
  }

  /// 错误视图
  Widget _buildErrorView(MuseDashController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(controller.errorMessage),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => controller.refreshData(),
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 空视图
  Widget _buildEmptyView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.music_off, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('没有找到符合条件的曲目'),
        ],
      ),
    );
  }

  /// 曲目列表
  Widget _buildMusicList(
    List<MuseDashMusic> musicList,
    MuseDashController controller,
  ) {
    return RefreshIndicator(
      onRefresh: () => controller.refreshData(),
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 100,
        ),
        itemCount: musicList.length,
        itemBuilder: (context, index) {
          final music = musicList[index];
          return _buildMusicCard(music, controller);
        },
      ),
    );
  }

  /// 曲目卡片
  Widget _buildMusicCard(MuseDashMusic music, MuseDashController controller) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // TODO: 打开曲目详情页
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 封面图
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: music.coverUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: const Icon(Icons.music_note),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // 曲目信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      music.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      music.author,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '曲包: ${controller.getAlbumName(music.albumUid)}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // 难度信息
              _buildDifficultyChips(music),
            ],
          ),
        ),
      ),
    );
  }

  /// 难度芯片
  Widget _buildDifficultyChips(MuseDashMusic music) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (music.difficulty.isNotEmpty) ...[
          Wrap(
            spacing: 2,
            runSpacing: 2,
            children: List.generate(music.difficulty.length, (index) {
              final diffStr = music.difficulty[index];
              final diff = int.tryParse(diffStr) ?? 0;

              // 难度为 0 不显示
              if (diff == 0) {
                return const SizedBox.shrink();
              }

              // 根据难度在数组中的位置设置颜色: 绿(0) 蓝(1) 紫(2) 黑(3) 白(4)
              Color color;
              switch (index) {
                case 0:
                  color = Colors.green; // 第1个难度 - 绿色
                  break;
                case 1:
                  color = Colors.blue; // 第2个难度 - 蓝色
                  break;
                case 2:
                  color = Colors.purple; // 第3个难度 - 紫色
                  break;
                case 3:
                  color = Colors.black; // 第4个难度 - 黑色
                  break;
                case 4:
                default:
                  color = Colors.white; // 第5个难度 - 白色
                  break;
              }

              return Stack(
                alignment: Alignment.center,
                children: [
                  // 星星外框（半透明）
                  Icon(Icons.star, size: 32, color: color.withOpacity(0.7)),
                  // 难度数字
                  Text(
                    diffStr,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: index == 4 ? Colors.black : Colors.white,
                      shadows: index == 4
                          ? null
                          : [
                              const Shadow(
                                offset: Offset(0.5, 0.5),
                                blurRadius: 1,
                                color: Colors.black45,
                              ),
                            ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
        const SizedBox(height: 4),
        if (music.bpm.isNotEmpty)
          Text(
            'BPM: ${music.bpm}',
            style: TextStyle(fontSize: 10, color: Colors.grey[500]),
          ),
      ],
    );
  }
}
