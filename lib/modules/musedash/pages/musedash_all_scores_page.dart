import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/musedash/musedash_controller.dart';
import 'package:rank_hub/models/musedash/musedash_score.dart';
import 'package:rank_hub/models/musedash/musedash_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/controllers/account_controller.dart';

/// MuseDash 所有成绩页面
class MuseDashAllScoresPage extends StatefulWidget {
  const MuseDashAllScoresPage({super.key});

  @override
  State<MuseDashAllScoresPage> createState() => _MuseDashAllScoresPageState();
}

enum SortType { score, accuracy, globalRank, platformRank }

class _MuseDashAllScoresPageState extends State<MuseDashAllScoresPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<MuseDashController>();
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isLoading = false;
  String _errorMessage = '';
  MuseDashPlayer? _player;
  List<MuseDashScore> _allScores = [];
  List<MuseDashScore> _filteredScores = [];
  SortType _sortType = SortType.score;
  bool _isAscending = false;

  // 筛选条件
  String _searchQuery = '';
  String? _selectedDifficulty;
  bool _showFilters = true; // 控制过滤和排序组件的显示

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward(); // 初始状态为展开
    _scrollController.addListener(_onScroll);
    _syncAndLoadScores();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // 滚动到顶部（偏移量小于50）时显示，否则隐藏
    final shouldShow = _scrollController.offset < 50;
    if (shouldShow != _showFilters) {
      setState(() {
        _showFilters = shouldShow;
        if (shouldShow) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    }
  }

  Future<void> _syncAndLoadScores() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;

      if (currentAccount == null || currentAccount.apiKey == null) {
        setState(() {
          _errorMessage = '请先绑定 MuseDash 账号';
          _isLoading = false;
        });
        return;
      }

      final userUuid = currentAccount.apiKey!;

      // 先尝试从本地加载
      final localPlayer = await controller.getPlayerInfo(userUuid);
      final localScores = await controller.getAllScores(userUuid);

      if (localPlayer != null) {
        setState(() {
          _player = localPlayer;
          _allScores = localScores;
          _applyFilters();
        });
      }

      // 后台同步最新数据
      await controller.syncPlayerScores(userUuid);

      // 重新加载
      final player = await controller.getPlayerInfo(userUuid);
      final scores = await controller.getAllScores(userUuid);

      setState(() {
        _player = player;
        _allScores = scores;
        _applyFilters();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '加载成绩失败: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    try {
      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;

      if (currentAccount == null || currentAccount.apiKey == null) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('请先绑定 MuseDash 账号')));
        }
        return;
      }

      final userUuid = currentAccount.apiKey!;

      await controller.syncPlayerScores(userUuid);

      final player = await controller.getPlayerInfo(userUuid);
      final scores = await controller.getAllScores(userUuid);

      setState(() {
        _player = player;
        _allScores = scores;
        _applyFilters();
        _errorMessage = '';
      });

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('成绩同步成功')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('同步失败: $e')));
      }
    }
  }

  void _applyFilters() {
    _filteredScores = _allScores.where((score) {
      // 搜索过滤
      if (_searchQuery.isNotEmpty) {
        final music = controller.music.firstWhereOrNull(
          (m) => m.uid == score.musicUid,
        );
        final musicName = music?.name ?? score.musicUid;
        if (!musicName.toLowerCase().contains(_searchQuery.toLowerCase())) {
          return false;
        }
      }

      // 难度过滤
      if (_selectedDifficulty != null) {
        if (score.difficulty.toString() != _selectedDifficulty) {
          return false;
        }
      }

      return true;
    }).toList();

    _sortScores();
  }

  void _sortScores() {
    setState(() {
      switch (_sortType) {
        case SortType.score:
          _filteredScores.sort((a, b) {
            final aScore = a.score ?? 0;
            final bScore = b.score ?? 0;
            return _isAscending
                ? aScore.compareTo(bScore)
                : bScore.compareTo(aScore);
          });
          break;
        case SortType.accuracy:
          _filteredScores.sort((a, b) {
            final aAcc = a.acc ?? 0;
            final bAcc = b.acc ?? 0;
            return _isAscending ? aAcc.compareTo(bAcc) : bAcc.compareTo(aAcc);
          });
          break;
        case SortType.globalRank:
          _filteredScores.sort((a, b) {
            final aRank = a.globalRank ?? 999999;
            final bRank = b.globalRank ?? 999999;
            return _isAscending
                ? aRank.compareTo(bRank)
                : bRank.compareTo(aRank);
          });
          break;
        case SortType.platformRank:
          _filteredScores.sort((a, b) {
            final aRank = a.platformRank ?? 999999;
            final bRank = b.platformRank ?? 999999;
            return _isAscending
                ? aRank.compareTo(bRank)
                : bRank.compareTo(aRank);
          });
          break;
      }
    });
  }

  // 计算统计数据
  int get _totalScores => _allScores.length;

  int get _perfectCount {
    return _allScores
        .where((score) => score.acc != null && score.acc! >= 100.0)
        .length;
  }

  double get _averagePct {
    if (_allScores.isEmpty) return 0.0;
    final sum = _allScores.fold<double>(
      0.0,
      (sum, score) => sum + (score.acc ?? 0.0),
    );
    return sum / _allScores.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 统计信息卡片
          if (_player != null) _buildStatsCard(),

          // 搜索和筛选栏（根据滚动显示/隐藏，带动画）
          SizeTransition(
            sizeFactor: _animation,
            child: FadeTransition(
              opacity: _animation,
              child: _buildSearchAndFilterBar(),
            ),
          ),

          // 排序选项栏（根据滚动显示/隐藏，带动画）
          SizeTransition(
            sizeFactor: _animation,
            child: FadeTransition(opacity: _animation, child: _buildSortBar()),
          ),

          // 成绩列表
          Expanded(child: _buildScoresList()),
        ],
      ),
    );
  }

  Widget _buildStatsCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('总成绩数', _totalScores.toString()),
                _buildStatColumn('PERFECT', _perfectCount.toString()),
                _buildStatColumn(
                  'Avg. Pct',
                  '${_averagePct.toStringAsFixed(2)}%',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildSearchAndFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索曲目...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _applyFilters();
                });
              },
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            tooltip: '难度筛选',
            onSelected: (value) {
              setState(() {
                _selectedDifficulty = value == 'all' ? null : value;
                _applyFilters();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'all', child: Text('全部难度')),
              const PopupMenuItem(value: '0', child: Text('萌新')),
              const PopupMenuItem(value: '1', child: Text('高手')),
              const PopupMenuItem(value: '2', child: Text('大触')),
              const PopupMenuItem(value: '3', child: Text('隐藏')),
              const PopupMenuItem(value: '4', child: Text('N (仅东方)')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSortBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Text(
            '排序:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSortChip('分数', SortType.score),
                  const SizedBox(width: 8),
                  _buildSortChip('准确率', SortType.accuracy),
                  const SizedBox(width: 8),
                  _buildSortChip('全平台排名', SortType.globalRank),
                  const SizedBox(width: 8),
                  _buildSortChip('客户端排名', SortType.platformRank),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              _isAscending ? Icons.arrow_upward : Icons.arrow_downward,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _isAscending = !_isAscending;
              });
              _sortScores();
            },
            tooltip: _isAscending ? '升序' : '降序',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildSortChip(String label, SortType type) {
    final isSelected = _sortType == type;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _sortType = type;
          });
          _sortScores();
        }
      },
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildScoresList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(_errorMessage),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _syncAndLoadScores,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (_filteredScores.isEmpty) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _searchQuery.isNotEmpty || _selectedDifficulty != null
                        ? Icons.search_off
                        : Icons.music_off,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _searchQuery.isNotEmpty || _selectedDifficulty != null
                        ? '没有符合条件的成绩'
                        : '暂无成绩数据',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 100,
        ),
        itemCount: _filteredScores.length,
        itemBuilder: (context, index) {
          final score = _filteredScores[index];
          return _buildScoreCard(score);
        },
      ),
    );
  }

  Widget _buildScoreCard(MuseDashScore score) {
    final music = controller.music.firstWhereOrNull(
      (m) => m.uid == score.musicUid,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (music != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: music.coverUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                        child: const Icon(Icons.music_note, size: 24),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 24),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.music_note, size: 24),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        music?.name ?? score.musicUid,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      if (music != null)
                        Text(
                          music.author,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildDifficultyChip(score.difficulty, score),
                const SizedBox(width: 12),
                if (score.score != null) ...[
                  Text(
                    score.score.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Text(
                  '${(score.acc ?? 0).toStringAsFixed(2)}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _getRankBadgeColor(score.rank),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    score.rank,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (score.globalRank != null) ...[
                  Icon(Icons.public, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 3),
                  Text(
                    '#${score.globalRank}',
                    style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                ],
                if (score.platformRank != null) ...[
                  Icon(Icons.devices, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 3),
                  Text(
                    '#${score.platformRank}',
                    style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                ],
                if (score.platform != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      score.platform!.toUpperCase(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
              ],
            ),
            if (score.characterUid != null || score.elfinUid != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  if (score.characterUid != null) ...[
                    Icon(Icons.person, size: 12, color: Colors.grey[600]),
                    const SizedBox(width: 3),
                    Text(
                      _getCharacterName(score.characterUid!),
                      style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (score.elfinUid != null) ...[
                    Icon(Icons.pets, size: 12, color: Colors.grey[600]),
                    const SizedBox(width: 3),
                    Text(
                      _getElfinName(score.elfinUid!),
                      style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getRankBadgeColor(String rank) {
    switch (rank) {
      case 'SSS':
        return Colors.amber;
      case 'SS':
        return Colors.blueGrey;
      case 'S':
        return Colors.purple;
      case 'A':
        return Colors.pink;
      case 'B':
        return Colors.blue;
      default:
        return Colors.brown;
    }
  }

  String _getCharacterName(String characterUid) {
    try {
      final characterId = int.parse(characterUid);
      final character = controller.characters.firstWhereOrNull(
        (c) => c.characterId == characterId,
      );
      return character?.characterName ?? characterUid;
    } catch (e) {
      return characterUid;
    }
  }

  String _getElfinName(String elfinUid) {
    try {
      final elfinId = int.parse(elfinUid);
      final elfin = controller.elfins.firstWhereOrNull(
        (e) => e.elfinId == elfinId,
      );
      return elfin?.name ?? elfinUid;
    } catch (e) {
      return elfinUid;
    }
  }

  Widget _buildDifficultyChip(int difficulty, MuseDashScore score) {
    final music = controller.music.firstWhereOrNull(
      (m) => m.uid == score.musicUid,
    );

    String levelText = '?';
    if (music != null && difficulty < music.difficulty.length) {
      final level = music.difficulty[difficulty];
      if (level != '0') {
        levelText = level;
      }
    }

    Color color;
    switch (difficulty) {
      case 0:
        color = Colors.green;
        break;
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.purple;
        break;
      case 3:
        color = Colors.black;
        break;
      case 4:
        color = Colors.white;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        levelText,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: difficulty == 3 || difficulty == 4 ? Colors.white : color,
        ),
      ),
    );
  }
}
