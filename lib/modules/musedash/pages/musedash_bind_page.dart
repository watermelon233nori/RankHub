import 'package:flutter/material.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/modules/musedash/services/musedash_api_service.dart';

/// MuseDash 账号绑定页面
class MuseDashBindPage extends StatefulWidget {
  const MuseDashBindPage({super.key});

  @override
  State<MuseDashBindPage> createState() => _MuseDashBindPageState();
}

class _MuseDashBindPageState extends State<MuseDashBindPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _apiService = MuseDashApiService.instance;
  final _uuidController = TextEditingController();
  final _searchController = TextEditingController();
  final _searchResults = <List<String>>[];

  bool _isSearching = false;
  bool _isValidating = false;
  String? _errorMessage;
  String? _searchErrorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _errorMessage = null;
        _searchErrorMessage = null;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _uuidController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchUsers() async {
    final name = _searchController.text.trim();
    if (name.isEmpty) {
      setState(() {
        _searchErrorMessage = '请输入用户名';
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _searchErrorMessage = null;
      _searchResults.clear();
    });

    try {
      final results = await _apiService.searchUsers(name);
      setState(() {
        _searchResults.addAll(results);
        _isSearching = false;
        if (results.isEmpty) {
          _searchErrorMessage = '未找到匹配的用户';
        }
      });
    } catch (e) {
      setState(() {
        _isSearching = false;
        _searchErrorMessage = '搜索失败，请检查网络连接';
      });
    }
  }

  Future<void> _bindWithUuid(
    String uuid, {
    bool showLoadingDialog = false,
  }) async {
    if (uuid.isEmpty) {
      setState(() {
        _errorMessage = '请输入 UUID';
      });
      return;
    }

    // 如果需要显示对话框（从搜索结果点击）
    if (showLoadingDialog && mounted) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('正在验证账号...'),
                ],
              ),
            ),
          ),
        ),
      );
    }

    setState(() {
      _isValidating = true;
      _errorMessage = null;
    });

    try {
      final playerInfo = await _apiService.getPlayerInfo(uuid);

      if (playerInfo == null) {
        if (showLoadingDialog && mounted) {
          Navigator.of(context).pop(); // 关闭加载对话框
        }
        setState(() {
          _isValidating = false;
          _errorMessage = '找不到该 UUID 对应的玩家';
        });
        return;
      }

      if (!mounted) return;

      // 关闭加载对话框（如果有）
      if (showLoadingDialog) {
        Navigator.of(context).pop();
      }

      // 返回登录结果，包含平台图标作为头像
      Navigator.of(context).pop(
        PlatformLoginResult(
          externalId: uuid,
          credentialData: {'api_key': uuid},
          displayName: playerInfo.nickname,
          avatarUrl:
              'https://musedash.moe/img/icons/android-chrome-512x512.png',
          metadata: playerInfo.toJson(),
        ),
      );
    } catch (e) {
      if (showLoadingDialog && mounted) {
        Navigator.of(context).pop(); // 关闭加载对话框
      }
      setState(() {
        _isValidating = false;
        _errorMessage = '验证失败，请检查网络连接';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('绑定 MuseDash.moe'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'UUID 绑定', icon: Icon(Icons.key)),
            Tab(text: '用户名搜索', icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildUuidTab(colorScheme), _buildSearchTab(colorScheme)],
      ),
    );
  }

  Widget _buildUuidTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 说明卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '使用 UUID 绑定',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '如果你已经知道自己的 UUID，可以直接输入进行绑定。',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• UUID 是一个唯一标识符，通常为 32 个字符\n• 可以在 MuseDash.moe 网站找到你的 UUID',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // UUID 输入框
          TextField(
            controller: _uuidController,
            decoration: InputDecoration(
              labelText: 'UUID',
              hintText: '请输入你的 UUID',
              prefixIcon: const Icon(Icons.key),
              border: const OutlineInputBorder(),
              errorText: _errorMessage,
            ),
            onSubmitted: (value) {
              final uuid = value.trim();
              if (uuid.isEmpty) {
                setState(() {
                  _errorMessage = '请输入 UUID';
                });
                return;
              }
              _bindWithUuid(uuid);
            },
          ),
          const SizedBox(height: 24),

          // 绑定按钮
          FilledButton.icon(
            onPressed: _isValidating
                ? null
                : () {
                    final uuid = _uuidController.text.trim();
                    if (uuid.isEmpty) {
                      setState(() {
                        _errorMessage = '请输入 UUID';
                      });
                      return;
                    }
                    _bindWithUuid(uuid);
                  },
            icon: _isValidating
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.check),
            label: Text(_isValidating ? '验证中...' : '绑定账号'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTab(ColorScheme colorScheme) {
    return Column(
      children: [
        // 搜索区域
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名进行搜索',
                  prefixIcon: const Icon(Icons.person_search),
                  border: const OutlineInputBorder(),
                  errorText: _searchErrorMessage,
                  filled: true,
                  fillColor: colorScheme.surface,
                ),
                onSubmitted: (_) {
                  final name = _searchController.text.trim();
                  if (name.isEmpty) {
                    setState(() {
                      _searchErrorMessage = '请输入用户名';
                    });
                    return;
                  }
                  _searchUsers();
                },
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _isSearching
                    ? null
                    : () {
                        final name = _searchController.text.trim();
                        if (name.isEmpty) {
                          setState(() {
                            _searchErrorMessage = '请输入用户名';
                          });
                          return;
                        }
                        _searchUsers();
                      },
                icon: _isSearching
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.search),
                label: Text(_isSearching ? '搜索中...' : '搜索'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),

        // 搜索结果列表
        Expanded(child: _buildSearchResults(colorScheme)),
      ],
    );
  }

  Widget _buildSearchResults(ColorScheme colorScheme) {
    if (_isSearching) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_searchResults.isEmpty && _searchErrorMessage == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              '输入用户名开始搜索',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty && _searchErrorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: colorScheme.error),
            const SizedBox(height: 16),
            Text(
              _searchErrorMessage!,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: colorScheme.error),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final result = _searchResults[index];
        final name = result[0];
        final uuid = result[1];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                uuid,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: colorScheme.onSurfaceVariant,
            ),
            onTap: _isValidating
                ? null
                : () => _bindWithUuid(uuid, showLoadingDialog: true),
          ),
        );
      },
    );
  }
}
