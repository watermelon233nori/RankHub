import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/phigros/phigros_controller.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_record_list_item.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'dart:ui';

/// Phigros 成绩列表视图
class PhigrosRecordListView extends StatefulWidget {
  const PhigrosRecordListView({super.key});

  @override
  State<PhigrosRecordListView> createState() => _PhigrosRecordListViewState();
}

class _PhigrosRecordListViewState extends State<PhigrosRecordListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<PhigrosController>();
    final accountController = Get.find<AccountController>();

    // 监听搜索框变化
    _searchController.addListener(() {
      controller.setRecordSearchKeyword(_searchController.text);
    });

    // 延迟加载成绩，避免在build期间触发状态更新
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (accountController.currentAccount != null) {
        controller.loadRecords(accountController.currentAccount!.id.toString());
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhigrosController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // 成绩列表
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.filteredRecords.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                final accountController = Get.find<AccountController>();
                if (accountController.currentAccount != null) {
                  await controller.loadRecords(
                    accountController.currentAccount!.id.toString(),
                    forceRefresh: true,
                  );
                }
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.music_off,
                          size: 64,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无成绩数据',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              final accountController = Get.find<AccountController>();
              if (accountController.currentAccount != null) {
                await controller.loadRecords(
                  accountController.currentAccount!.id.toString(),
                  forceRefresh: true,
                );
              }
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 200),
              itemCount: controller.filteredRecords.length,
              itemBuilder: (context, index) {
                final record = controller.filteredRecords[index];
                return PhigrosRecordListItem(record: record);
              },
            ),
          );
        }),

        // 搜索栏 - 浮在底部
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withOpacity(0.8),
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 搜索框
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: '搜索曲目...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: Obx(() {
                            // 使用controller中的响应式变量
                            if (controller.recordSearchKeyword.value.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            );
                          }),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
