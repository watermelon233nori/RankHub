import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/shared/widgets/hideable_bottom_bar.dart';

class LxMaiRecordView extends ConsumerStatefulWidget {
  const LxMaiRecordView({super.key, required this.listView, required this.filterViewBuilder});

  final Widget listView;
  final HideableBottomBar Function(bool) filterViewBuilder;

  @override
  ConsumerState<LxMaiRecordView> createState() => _LxMaiRecordViewState();
}

class _LxMaiRecordViewState extends ConsumerState<LxMaiRecordView> {
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
      body: widget.listView,
      bottomNavigationBar: SafeArea(child: widget.filterViewBuilder(visible)),
    );
  }
}
