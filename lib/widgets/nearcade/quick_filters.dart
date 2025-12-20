import 'package:flutter/material.dart';

class QuickFilters extends StatefulWidget {
  final Function(String)? onFilterSelected;

  const QuickFilters({super.key, this.onFilterSelected});

  @override
  State<QuickFilters> createState() => _QuickFiltersState();
}

class _QuickFiltersState extends State<QuickFilters> {
  String _selectedFilter = 'recommended';

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'icon': Icons.star, 'label': '推荐', 'value': 'recommended'},
      {'icon': Icons.near_me, 'label': '最近', 'value': 'nearest'},
      {'icon': Icons.local_fire_department, 'label': '热门', 'value': 'popular'},
      {'icon': Icons.schedule, 'label': '营业中', 'value': 'open'},
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final value = filter['value'] as String;
          final isSelected = _selectedFilter == value;

          return FilterChip(
            avatar: Icon(filter['icon'] as IconData, size: 18),
            label: Text(filter['label'] as String),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                _selectedFilter = value;
              });
              widget.onFilterSelected?.call(value);
            },
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
            selectedColor: Theme.of(context).colorScheme.primaryContainer,
          );
        },
      ),
    );
  }
}
