import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap.dart';
import 'package:rank_hub/modules/osu/services/sayobot_api_service.dart';
import 'package:rank_hub/modules/osu/widgets/osu_beatmap_card.dart';

class OsuBeatmapListPage extends StatefulWidget {
  const OsuBeatmapListPage({super.key});

  @override
  State<OsuBeatmapListPage> createState() => _OsuBeatmapListPageState();
}

class _OsuBeatmapListPageState extends State<OsuBeatmapListPage> {
  final SayobotApiService _apiService = SayobotApiService();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  final List<SayobotBeatmap> _beatmaps = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentOffset = 0;
  String? _error;

  // Filters
  String _searchKeyword = '';
  int? _selectedMode; // 1, 2, 4, 8
  int? _selectedStatus; // 1, 2, 4...
  int? _selectedGenre;
  int? _selectedLanguage;
  RangeValues _starRange = const RangeValues(0, 10);

  // Filter Options (Simple maps for UI)
  final Map<String, int> _modes = {
    '所有模式':
        0, // Not sending mode param means all? Or 0? Doc says "1=std...". If omit, maybe all. Doc says default 0xffffffff
    'Standard': 1,
    'Taiko': 2,
    'Catch the Beat': 4,
    'Mania': 8,
  };

  final Map<String, int> _statuses = {
    '所有状态': 0, // Default 0xffffffff
    'Ranked & Approved': 1,
    'Qualified': 2,
    'Loved': 4,
    'Pending & WIP': 8,
    'Graveyard': 16,
  };

  @override
  void initState() {
    super.initState();
    _loadBeatmaps(refresh: true);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _loadBeatmaps();
    }
  }

  Future<void> _loadBeatmaps({bool refresh = false}) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      if (refresh) {
        _beatmaps.clear();
        _currentOffset = 0;
        _hasMore = true;
        _error = null;
      }
    });

    try {
      final response = await _apiService.getBeatmapList(
        keyword: _searchKeyword.isEmpty ? null : _searchKeyword,
        limit: 20,
        offset: _currentOffset,
        mode: _selectedMode == 0 ? null : _selectedMode,
        status: _selectedStatus == 0 ? null : _selectedStatus,
        genre: _selectedGenre == 0 ? null : _selectedGenre,
        language: _selectedLanguage == 0 ? null : _selectedLanguage,
        stars: _starRange.start == 0 && _starRange.end == 10
            ? null
            : [_starRange.start, _starRange.end],
      );

      if (mounted) {
        setState(() {
          _beatmaps.addAll(response.data);
          _currentOffset = response.endid;
          // If response data is empty or endid is 0 (and not first page), maybe no more
          if (response.data.isEmpty || response.endid == 0) {
            // However, doc says endid=0 means finished.
            // But if initial request returns endid=0, it might mean total results < limit.
            // If we got some data, we keep it.
            if (response.endid == 0) {
              _hasMore = false;
            }
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_searchKeyword != value) {
        setState(() {
          _searchKeyword = value;
        });
        _loadBeatmaps(refresh: true);
      }
    });
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('筛选器', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
                _buildFilterSection(
                  '模式',
                  _modes,
                  _selectedMode ?? 0,
                  (val) => setState(() => _selectedMode = val),
                ),
                const Divider(),
                _buildFilterSection(
                  '状态',
                  _statuses,
                  _selectedStatus ?? 0,
                  (val) => setState(() => _selectedStatus = val),
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '难度星级: ${_starRange.start.toStringAsFixed(1)} - ${_starRange.end.toStringAsFixed(1)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    RangeSlider(
                      values: _starRange,
                      min: 0,
                      max: 10,
                      divisions: 100,
                      labels: RangeLabels(
                        _starRange.start.toStringAsFixed(1),
                        _starRange.end.toStringAsFixed(1),
                      ),
                      onChanged: (values) {
                        setState(() {
                          _starRange = values;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _loadBeatmaps(refresh: true);
                    },
                    child: const Text('应用筛选'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(
    String title,
    Map<String, int> options,
    int selectedValue,
    Function(int) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: options.entries.map((entry) {
            final isSelected = selectedValue == entry.value;
            return FilterChip(
              label: Text(entry.key),
              selected: isSelected,
              onSelected: (bool selected) {
                if (selected) {
                  onChanged(entry.value);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: '搜索铺面...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          onChanged: _onSearchChanged,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterSheet,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_beatmaps.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null && _beatmaps.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('加载失败: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _loadBeatmaps(refresh: true),
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    if (_beatmaps.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text('没有找到相关铺面'),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: _beatmaps.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _beatmaps.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return OsuBeatmapCard(beatmap: _beatmaps[index]);
      },
    );
  }
}
