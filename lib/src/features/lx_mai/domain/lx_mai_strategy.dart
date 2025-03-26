import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rank_hub/src/core/abstract/mode_strategy.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_view.dart';

class LxMaiStrategy implements ModeStrategy {
  @override
  String getDataSourceLocation() {
    return "maimai.lxns.net";
  }

  @override
  String getGameName() {
    return "舞萌 DX";
  }

  @override
  String getModeDescription() {
    return "落雪咖啡屋 - 舞萌 DX 查分器";
  }

  @override
  ImageProvider<Object> getModeIcon() {
    return const CachedNetworkImageProvider("https://maimai.lxns.net/favicon.webp");
  }

  @override
  String getModeName() {
    return "落雪查分器";
  }

  @override
  Map<String, Widget> getRecordViews(String uuid) {
    return {
      "所有成绩": LxMaiRecordView(uuid),
    };
  }
  
}