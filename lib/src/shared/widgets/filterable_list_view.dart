import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterableListView extends ConsumerStatefulWidget {
  const FilterableListView(
      {super.key,
      required this.filterViewBuilder,
      required this.listViewBuilder});

  final Widget Function(bool) filterViewBuilder;
  final Widget Function(ScrollController) listViewBuilder;

  @override
  ConsumerState<FilterableListView> createState() => _LxMaiRecordViewState();
}

class _LxMaiRecordViewState extends ConsumerState<FilterableListView> {
  final scrollController = ScrollController();
  bool visible = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      bool shouldBeVisible = scrollController.position.userScrollDirection !=
          ScrollDirection.reverse;
      if (visible != shouldBeVisible) {
        setState(() => visible = shouldBeVisible);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.listViewBuilder(scrollController),
      bottomNavigationBar: SafeArea(child: widget.filterViewBuilder(visible)),
    );
  }
}
