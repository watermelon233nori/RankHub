import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_filter_bar.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_list.dart';

class LxMaiRecordView extends ConsumerStatefulWidget {
  const LxMaiRecordView(this.uuid, {super.key});

  final String uuid;

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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: LxMaiRecordList(
          uuid: widget.uuid, scrollController: scrollController),
      bottomNavigationBar: SafeArea(child: LxMaiRecordFilterBar(visible)),
    );
  }
}
