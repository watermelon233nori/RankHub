import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rank_hub/src/core/abstract/mode_strategy.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_b50_view.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_view.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_song_view.dart';

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
    return const CachedNetworkImageProvider(
        "https://maimai.lxns.net/favicon.webp");
  }

  @override
  String getModeName() {
    return "落雪查分器";
  }

  @override
  Map<String, Widget> getRecordViews(String uuid) {
    return {
      "所有成绩": LxMaiRecordView(uuid: uuid),
      "B50": LxMaiB50View(uuid),
    };
  }

  @override
  Map<String, Widget> getLibraryViews(String uuid) {
    return {"所有歌曲": const LxMaiSongView(), "姓名框": Container()};
  }
  
  @override
  Map<Icon, Function> getRecordScreenActions() {
    return {
      const Icon(Icons.add): () {},
      const Icon(Icons.cloud_sync): () {},
    };
  }
}
