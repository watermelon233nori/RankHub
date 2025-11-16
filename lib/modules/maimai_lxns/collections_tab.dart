import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'maimai_lxns_controller.dart';
import 'widgets/collection_items.dart';

/// 收藏品列表 Tab
class CollectionsTab extends StatelessWidget {
  const CollectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaimaiLxnsController());

    return Obx(() {
      // 加载状态
      if (controller.loadStatus == DataLoadStatus.loadingFromDb ||
          controller.loadStatus == DataLoadStatus.loadingFromApi) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                controller.loadStatus == DataLoadStatus.loadingFromDb
                    ? '正在从数据库加载...'
                    : '正在从 API 加载...',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      }

      // 错误状态
      if (controller.loadStatus == DataLoadStatus.error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                controller.errorMessage,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => controller.loadCollections(),
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        );
      }

      // 空数据
      if (controller.filteredCollections.isEmpty &&
          controller.collections.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.collections_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text('暂无收藏品数据', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                '请先同步数据',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      }

      // 显示数据
      return Column(
        children: [
          // 筛选和搜索栏
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // 类型选择下拉框
                DropdownButtonFormField<String>(
                  value: controller.selectedCollectionType,
                  decoration: const InputDecoration(
                    labelText: '收藏品类型',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'trophy', child: Text('称号')),
                    DropdownMenuItem(value: 'icon', child: Text('头像')),
                    DropdownMenuItem(value: 'plate', child: Text('姓名框')),
                    DropdownMenuItem(value: 'frame', child: Text('背景')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      controller.setCollectionType(value);
                    }
                  },
                ),
                const SizedBox(height: 12),
                // 搜索框
                TextField(
                  decoration: InputDecoration(
                    labelText: '搜索收藏品',
                    hintText: '输入名称或描述',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: controller.collectionSearchKeyword.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              controller.setCollectionSearchKeyword('');
                            },
                          )
                        : null,
                  ),
                  onChanged: (value) {
                    controller.setCollectionSearchKeyword(value);
                  },
                ),
                const SizedBox(height: 8),
                // 统计信息
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '共 ${controller.filteredCollectionsCount} 件',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 收藏品列表
          Expanded(
            child: controller.filteredCollections.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '未找到匹配的收藏品',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.filteredCollections.length,
                    itemBuilder: (context, index) {
                      final collection = controller.filteredCollections[index];
                      return CollectionListItem(collection: collection);
                    },
                  ),
          ),
        ],
      );
    });
  }
}
