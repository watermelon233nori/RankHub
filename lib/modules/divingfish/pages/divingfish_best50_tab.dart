import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/divingfish/controllers/divingfish_maimai_controller.dart';
import 'package:rank_hub/modules/divingfish/widgets/divingfish_compact_score_card.dart';
import 'package:rank_hub/models/divingfish/divingfish_score.dart';

/// 水鱼查分器 - Best 50 页面
class DivingFishBest50Tab extends StatefulWidget {
  const DivingFishBest50Tab({super.key});

  @override
  State<DivingFishBest50Tab> createState() => _DivingFishBest50TabState();
}

class _DivingFishBest50TabState extends State<DivingFishBest50Tab> {
  final controller = Get.find<DivingFishMaimaiController>();

  /// 根据 Rating 获取渐变效果
  ShaderMask getShaderMaskByRating(int rating, Widget child) {
    LinearGradient gradient;

    if (rating < 0) {
      gradient = const LinearGradient(colors: [Colors.grey, Colors.grey]);
    } else if (rating <= 999) {
      gradient = const LinearGradient(colors: [Colors.white, Colors.white]);
    } else if (rating <= 1999) {
      gradient = const LinearGradient(colors: [Colors.blue, Colors.blueAccent]);
    } else if (rating <= 3999) {
      gradient = const LinearGradient(
        colors: [Colors.green, Colors.lightGreen],
      );
    } else if (rating <= 6999) {
      gradient = const LinearGradient(colors: [Colors.yellow, Colors.orange]);
    } else if (rating <= 9999) {
      gradient = const LinearGradient(colors: [Colors.red, Colors.redAccent]);
    } else if (rating <= 11999) {
      gradient = const LinearGradient(
        colors: [Colors.purple, Colors.deepPurple],
      );
    } else if (rating <= 12999) {
      gradient = const LinearGradient(
        colors: [Color(0xFFCD7F32), Color(0xFFB87333)],
      ); // 铜色
    } else if (rating <= 13999) {
      gradient = const LinearGradient(
        colors: [Colors.grey, Colors.blueGrey],
      ); // 银色
    } else if (rating <= 14499) {
      gradient = const LinearGradient(
        colors: [Colors.amber, Colors.orangeAccent],
      ); // 金色
    } else if (rating <= 14999) {
      gradient = const LinearGradient(
        colors: [
          Color.fromARGB(255, 252, 208, 122),
          Color.fromARGB(255, 252, 255, 160),
        ],
      ); // 白金色
    } else {
      gradient = const LinearGradient(
        colors: [
          Color.fromARGB(255, 47, 214, 184),
          Color.fromARGB(255, 56, 91, 187),
          Color.fromARGB(255, 180, 67, 188),
        ],
      ); // 彩虹色
    }

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }

  /// 格式化 Rating 为五位数，不足的用灰色 0 补足
  Widget _buildRatingText(
    BuildContext context,
    int rating, {
    bool useGradient = false,
    TextStyle? baseStyle,
  }) {
    final ratingStr = rating.toString();
    final paddingCount = 5 - ratingStr.length;

    final textStyle =
        baseStyle ??
        Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );

    if (paddingCount <= 0) {
      final textWidget = Text(ratingStr, style: textStyle);
      return useGradient
          ? getShaderMaskByRating(rating, textWidget)
          : textWidget;
    }

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '0' * paddingCount,
          style: textStyle?.copyWith(color: Colors.grey),
        ),
        Text(ratingStr, style: textStyle),
      ],
    );

    return useGradient ? getShaderMaskByRating(rating, content) : content;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.scores.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text('暂无成绩数据', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                '请先登录并同步数据',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => controller.loadScores(forceRefresh: true),
                icon: const Icon(Icons.refresh),
                label: const Text('刷新数据'),
              ),
            ],
          ),
        );
      }

      // 构建 songId -> song 映射
      final songMap = {for (final song in controller.songs) song.songId: song};

      // 根据 basic_info.is_new 拆分当前版本与往期版本
      final currentVersion = <DivingFishScore>[];
      final previousVersion = <DivingFishScore>[];

      for (final score in controller.scores) {
        final song = songMap[score.songId];
        final isNew = song?.basicInfo?.isNew ?? false;
        if (isNew) {
          currentVersion.add(score);
        } else {
          previousVersion.add(score);
        }
      }

      // 按 rating 排序
      currentVersion.sort((a, b) => b.ra.compareTo(a.ra));
      previousVersion.sort((a, b) => b.ra.compareTo(a.ra));

      // Best 15 / Best 35
      final best15 = currentVersion.take(15).toList();
      final best35 = previousVersion.take(35).toList();

      // 计算总 Rating
      final currentTotal = best15.fold<int>(0, (sum, s) => sum + s.ra);
      final previousTotal = best35.fold<int>(0, (sum, s) => sum + s.ra);
      final totalRating = currentTotal + previousTotal;

      final colorScheme = Theme.of(context).colorScheme;

      final currentStats = _calculateStats(best15);
      final previousStats = _calculateStats(best35);

      return RefreshIndicator(
        onRefresh: () => controller.loadScores(forceRefresh: true),
        child: CustomScrollView(
          slivers: [
            // 总览卡片
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (controller.playerData != null) ...[
                              Text(
                                controller.playerData!.nickname,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                    ),
                              ),
                              Text(
                                controller.playerData!.plate,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                    ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rating',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimaryContainer,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  _buildRatingText(
                                    context,
                                    controller.playerData?.rating ??
                                        totalRating,
                                    useGradient: true,
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildStatsRow(
                          context,
                          title: '当期版本 (B15)',
                          total: currentTotal,
                          stats: currentStats,
                          color: const Color(0xFF2196F3),
                        ),
                        const SizedBox(height: 12),
                        _buildStatsRow(
                          context,
                          title: '往期版本 (B35)',
                          total: previousTotal,
                          stats: previousStats,
                          color: const Color(0xFF4CAF50),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            // 当期版本 Best 15
            if (best15.isNotEmpty) ...[
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2196F3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '当期版本 Best 15',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          'Total: $currentTotal',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: const Color(0xFF2196F3),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: DivingFishCompactScoreCard(
                        best15[index],
                        rank: index + 1,
                      ),
                    ),
                    childCount: best15.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
            // 往期版本 Best 35
            if (best35.isNotEmpty) ...[
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '往期版本 Best 35',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          'Total: $previousTotal',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: const Color(0xFF4CAF50),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: DivingFishCompactScoreCard(
                        best35[index],
                        rank: index + 1,
                      ),
                    ),
                    childCount: best35.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
            if (best15.isEmpty && best35.isEmpty)
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Text('暂无 B50 数据'),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }

  Map<String, double> _calculateStats(List<DivingFishScore> scores) {
    if (scores.isEmpty) return {'min': 0, 'avg': 0, 'max': 0};

    final ratings = scores.map((s) => s.ra.toDouble()).toList();
    final min = ratings.reduce((a, b) => a < b ? a : b);
    final max = ratings.reduce((a, b) => a > b ? a : b);
    final avg = ratings.reduce((a, b) => a + b) / ratings.length;

    return {'min': min, 'avg': avg, 'max': max};
  }

  Widget _buildStatsRow(
    BuildContext context, {
    required String title,
    required int total,
    required Map<String, double> stats,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            _buildRatingText(
              context,
              total,
              baseStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
              context,
              label: 'Min',
              value: stats['min']!.truncateToDouble().toInt().toString(),
            ),
            _buildStatItem(
              context,
              label: 'Avg',
              value: stats['avg']!.truncateToDouble().toInt().toString(),
            ),
            _buildStatItem(
              context,
              label: 'Max',
              value: stats['max']!.truncateToDouble().toInt().toString(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  double get minExtent => 48.0;

  @override
  double get maxExtent => 48.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) => false;
}
