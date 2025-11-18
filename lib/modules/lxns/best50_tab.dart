import 'package:flutter/material.dart';
import 'package:rank_hub/models/maimai/score.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/lxns/services/maimai_api_service.dart';
import 'package:rank_hub/modules/lxns/widgets/compact_score_card.dart';

/// Best 50 成绩 Tab
class Best50Tab extends StatefulWidget {
  const Best50Tab({super.key});

  @override
  State<Best50Tab> createState() => _Best50TabState();
}

class _Best50TabState extends State<Best50Tab> {
  bool _isLoading = false;
  String? _errorMessage;

  // B50 数据
  List<Score> _dxScores = [];
  List<Score> _standardScores = [];
  int _dxTotal = 0;
  int _standardTotal = 0;

  @override
  void initState() {
    super.initState();
    _loadBest50();
  }

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
      // 已经是五位或更多，直接显示
      final textWidget = Text(ratingStr, style: textStyle);
      return useGradient
          ? getShaderMaskByRating(rating, textWidget)
          : textWidget;
    }

    // 需要补零
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // 灰色的前导零
        Text(
          '0' * paddingCount,
          style: textStyle?.copyWith(color: Colors.grey),
        ),
        // 实际数字
        Text(ratingStr, style: textStyle),
      ],
    );

    return useGradient ? getShaderMaskByRating(rating, content) : content;
  }

  /// 加载 Best 50 数据
  Future<void> _loadBest50() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 获取当前账号
      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;

      if (currentAccount == null) {
        throw Exception('未找到当前账号，请先登录');
      }

      final accessToken = currentAccount.accessToken;

      if (accessToken == null || accessToken.isEmpty) {
        throw Exception('未找到访问令牌，请重新登录');
      }

      // 调用 API 获取 B50 数据
      final data = await MaimaiApiService.instance.getPlayerBest50(
        accessToken: accessToken,
      );

      // 解析数据
      final dxList = data['dx'] as List;
      final standardList = data['standard'] as List;

      setState(() {
        _dxScores = dxList
            .map((e) => Score.fromJson(e as Map<String, dynamic>))
            .toList();
        _standardScores = standardList
            .map((e) => Score.fromJson(e as Map<String, dynamic>))
            .toList();
        _dxTotal = data['dx_total'] as int;
        _standardTotal = data['standard_total'] as int;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  /// 计算评分统计
  Map<String, double> _calculateStats(List<Score> scores) {
    if (scores.isEmpty) {
      return {'min': 0, 'avg': 0, 'max': 0};
    }

    final ratings = scores.map((s) => s.dxRating.toDouble()).toList();
    final min = ratings.reduce((a, b) => a < b ? a : b);
    final max = ratings.reduce((a, b) => a > b ? a : b);
    final avg = ratings.reduce((a, b) => a + b) / ratings.length;

    return {'min': min, 'avg': avg, 'max': max};
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // 加载中
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              '正在加载 Best 50...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    // 错误状态
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: colorScheme.error),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: TextStyle(color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _loadBest50,
              icon: const Icon(Icons.refresh),
              label: const Text('重试'),
            ),
          ],
        ),
      );
    }

    // 空数据
    if (_dxScores.isEmpty && _standardScores.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_outline,
              size: 64,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              '暂无 Best 50 数据',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '请先同步成绩数据',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    final dxStats = _calculateStats(_dxScores);
    final standardStats = _calculateStats(_standardScores);
    final totalRating = _dxTotal + _standardTotal;

    return RefreshIndicator(
      onRefresh: _loadBest50,
      child: CustomScrollView(
        slivers: [
          // 总览卡片
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // DX Rating 总和
                      Row(
                        children: [
                          Icon(Icons.star, color: colorScheme.primary),
                          const SizedBox(width: 8),
                          Text(
                            'DX Rating',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          _buildRatingText(
                            context,
                            totalRating,
                            useGradient: true,
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      // 当期版本评分
                      _buildStatsRow(
                        context,
                        title: '当期版本 (B15)',
                        total: _dxTotal,
                        stats: dxStats,
                        color: const Color(0xFF2196F3),
                      ),
                      const SizedBox(height: 16),
                      // 往期版本评分
                      _buildStatsRow(
                        context,
                        title: '往期版本 (B35)',
                        total: _standardTotal,
                        stats: standardStats,
                        color: const Color(0xFF4CAF50),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          // 当期版本成绩列表
          if (_dxScores.isNotEmpty) ...[
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Total: $_dxTotal',
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
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CompactScoreCard(_dxScores[index], rank: index + 1),
                  );
                }, childCount: _dxScores.length),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
          // 往期版本成绩列表
          if (_standardScores.isNotEmpty) ...[
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Total: $_standardTotal',
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
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CompactScoreCard(
                      _standardScores[index],
                      rank: index + 1,
                    ),
                  );
                }, childCount: _standardScores.length),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ],
      ),
    );
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

/// 吸顶标题的 Delegate
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
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) {
    return false;
  }
}
