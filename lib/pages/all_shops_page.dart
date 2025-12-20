import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/nearcade/shop.dart';
import 'package:rank_hub/routes/app_routes.dart';
import 'package:rank_hub/services/nearcade_api_service.dart';
import 'package:rank_hub/widgets/nearcade/shop_card.dart';

class AllShopsPage extends StatefulWidget {
  const AllShopsPage({super.key});

  @override
  State<AllShopsPage> createState() => _AllShopsPageState();
}

class _AllShopsPageState extends State<AllShopsPage> {
  final NearcadeApiService _apiService = NearcadeApiService();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Shop> _shops = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasNextPage = true;
  int _currentPage = 1;
  String? _error;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadShops();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasNextPage) {
      _loadMoreShops();
    }
  }

  Future<void> _loadShops({bool isRefresh = false}) async {
    if (isRefresh) {
      setState(() {
        _currentPage = 1;
        _shops.clear();
        _hasNextPage = true;
      });
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _apiService.getShops(
        q: _searchQuery.isEmpty ? null : _searchQuery,
        page: _currentPage,
        limit: 20,
      );

      setState(() {
        if (isRefresh) {
          _shops = response.shops;
        } else {
          _shops.addAll(response.shops);
        }
        _hasNextPage = response.hasNextPage;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMoreShops() async {
    if (!_hasNextPage || _isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
      _currentPage++;
    });

    try {
      final response = await _apiService.getShops(
        q: _searchQuery.isEmpty ? null : _searchQuery,
        page: _currentPage,
        limit: 20,
      );

      setState(() {
        _shops.addAll(response.shops);
        _hasNextPage = response.hasNextPage;
        _isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingMore = false;
        _currentPage--; // 回退页码
      });
      Get.snackbar('错误', '加载更多失败: $e');
    }
  }

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });
    _loadShops(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('所有机厅'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: _performSearch,
              decoration: InputDecoration(
                hintText: '搜索机厅名称或地址',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _performSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                setState(() {}); // 更新UI以显示/隐藏清除按钮
              },
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading && _shops.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null && _shops.isEmpty) {
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
            Text('加载失败', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _error!,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _loadShops(isRefresh: true),
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    if (_shops.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty ? '暂无机厅数据' : '未找到相关机厅',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadShops(isRefresh: true),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: _shops.length + (_hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _shops.length) {
            // 加载更多指示器
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: _isLoadingMore
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(),
              ),
            );
          }

          final shop = _shops[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ShopCard(
              shop: shop,
              onTap: () {
                Get.toNamed(AppRoutes.shopDetail, arguments: shop);
              },
              onNavigate: () {},
            ),
          );
        },
      ),
    );
  }
}
