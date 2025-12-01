import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rank_hub/services/log_service.dart';

/// 日志页面
class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final LogService _logService = LogService.instance;
  final TextEditingController _searchController = TextEditingController();
  final RxList<LogEntry> _filteredLogs = <LogEntry>[].obs;
  final RxSet<LogLevel> _selectedLevels = <LogLevel>{}.obs;
  final RxBool _autoScroll = true.obs;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _selectedLevels.addAll(LogLevel.values);
    _updateFilteredLogs();

    // 监听日志变化
    ever(_logService.logsRx, (_) {
      _updateFilteredLogs();
      if (_autoScroll.value) {
        _scrollToBottom();
      }
    });

    // 监听搜索和过滤变化
    ever(_selectedLevels, (_) => _updateFilteredLogs());
  }

  void _updateFilteredLogs() {
    final query = _searchController.text;
    List<LogEntry> logs;

    if (query.isEmpty) {
      logs = _logService.logs;
    } else {
      logs = _logService.searchLogs(query);
    }

    // 按级别过滤
    if (_selectedLevels.length < LogLevel.values.length) {
      logs = logs.where((log) => _selectedLevels.contains(log.level)).toList();
    }

    _filteredLogs.value = logs;
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('应用日志'),
        centerTitle: true,
        actions: [
          // 自动滚动开关
          Obx(
            () => IconButton(
              icon: Icon(
                _autoScroll.value
                    ? Icons.vertical_align_bottom
                    : Icons.vertical_align_center,
              ),
              tooltip: _autoScroll.value ? '关闭自动滚动' : '开启自动滚动',
              onPressed: () => _autoScroll.value = !_autoScroll.value,
            ),
          ),
          // 导出日志
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: '导出日志',
            onPressed: _exportLogs,
          ),
          // 清空日志
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: '清空日志',
            onPressed: _showClearConfirmDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // 搜索栏
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索日志...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _updateFilteredLogs();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (_) => _updateFilteredLogs(),
            ),
          ),

          // 级别过滤器
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => Wrap(
                spacing: 8,
                children: LogLevel.values.map((level) {
                  final isSelected = _selectedLevels.contains(level);
                  return FilterChip(
                    label: Text(_getLevelName(level)),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        _selectedLevels.add(level);
                      } else {
                        _selectedLevels.remove(level);
                      }
                    },
                    avatar: Icon(_getLevelIcon(level), size: 16),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // 日志统计
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                '共 ${_filteredLogs.length} 条日志',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),

          const Divider(height: 1),

          // 日志列表
          Expanded(
            child: Obx(() {
              if (_filteredLogs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article_outlined,
                        size: 64,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '暂无日志',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                controller: _scrollController,
                itemCount: _filteredLogs.length,
                itemBuilder: (context, index) {
                  final log = _filteredLogs[index];
                  return _LogEntryCard(
                    log: log,
                    onTap: () => _showLogDetail(log),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  String _getLevelName(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 'Debug';
      case LogLevel.info:
        return 'Info';
      case LogLevel.warning:
        return 'Warning';
      case LogLevel.error:
        return 'Error';
    }
  }

  IconData _getLevelIcon(LogLevel level) {
    return LogEntry.getLevelIconData(level);
  }

  void _showLogDetail(LogEntry log) {
    showDialog(
      context: context,
      builder: (context) => _LogDetailDialog(log: log),
    );
  }

  void _showClearConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清空日志'),
        content: const Text('确定要清空所有日志吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _logService.clear();
              Get.snackbar('成功', '日志已清空');
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('清空'),
          ),
        ],
      ),
    );
  }

  void _exportLogs() {
    final logs = _logService.exportLogs();
    Clipboard.setData(ClipboardData(text: logs));
    Get.snackbar('成功', '日志已复制到剪贴板', snackPosition: SnackPosition.BOTTOM);
  }
}

/// 日志条目卡片
class _LogEntryCard extends StatelessWidget {
  final LogEntry log;
  final VoidCallback onTap;

  const _LogEntryCard({required this.log, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final levelColor = _getLevelColor(log.level, colorScheme);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: levelColor, width: 4),
            bottom: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  LogEntry.getLevelIconData(log.level),
                  size: 16,
                  color: levelColor,
                ),
                const SizedBox(width: 8),
                Text(
                  log.levelName,
                  style: TextStyle(
                    color: levelColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                if (log.tag != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      log.tag!,
                      style: TextStyle(
                        fontSize: 10,
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  log.formattedTime,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              log.message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Color _getLevelColor(LogLevel level, ColorScheme colorScheme) {
    switch (level) {
      case LogLevel.debug:
        return Colors.blue;
      case LogLevel.info:
        return Colors.green;
      case LogLevel.warning:
        return Colors.orange;
      case LogLevel.error:
        return colorScheme.error;
    }
  }
}

/// 日志详情对话框
class _LogDetailDialog extends StatelessWidget {
  final LogEntry log;

  const _LogDetailDialog({required this.log});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(LogEntry.getLevelIconData(log.level), size: 24),
          const SizedBox(width: 8),
          Text(log.levelName),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfoRow('时间', log.formattedTime),
            if (log.tag != null) _buildInfoRow('标签', log.tag!),
            const SizedBox(height: 16),
            Text(
              '消息:',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectableText(
              log.message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (log.stackTrace != null) ...[
              const SizedBox(height: 16),
              Text(
                '堆栈跟踪:',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  log.stackTrace!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Clipboard.setData(
              ClipboardData(text: '${log.message}\n${log.stackTrace ?? ''}'),
            );
            Get.snackbar('成功', '已复制到剪贴板');
          },
          child: const Text('复制'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('关闭'),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: SelectableText(value)),
        ],
      ),
    );
  }
}
