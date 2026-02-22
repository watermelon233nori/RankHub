import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fullscreen/flutter_fullscreen.dart';
import 'package:phasetida_flutter/phasetida_flutter.dart';
import 'package:rank_hub/models/phigros/chart.dart';
import 'package:rank_hub/models/phigros/song.dart';
import 'package:rank_hub/modules/phigros/services/phigros_resource_api_service.dart';

class PhigrosChartPreviewPage extends StatefulWidget {
  final PhigrosSong song;
  final PhigrosChart chart;
  final String chartComposer;

  const PhigrosChartPreviewPage({
    super.key,
    required this.song,
    required this.chart,
    required this.chartComposer,
  });

  @override
  State<StatefulWidget> createState() => _PhigrosChartPreviewPageState();
}

class _PhigrosChartPreviewPageState extends State<PhigrosChartPreviewPage> {
  late String json;
  Uint8List? songBuffer;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    FullScreen.setFullScreen(true);
    _load();
  }

  Future<void> _load() async {
    json = widget.chart.toJsonString();
    try {
      songBuffer = await PhigrosResourceApiService.instance.fetchOgg(
        widget.song.songId,
      );
    } catch (e) {
      songBuffer = utf8.encode(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([]);
    FullScreen.setFullScreen(false);
  }

  Widget _loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          const SizedBox(height: 8),
          Text("获取资源...", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: isLoading
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 200),
      firstChild: _loadingWidget(),
      secondChild: isLoading
          ? SizedBox.shrink()
          : PhigrosChartPlayerShellWidget(
              jsonData: json,
              songName: widget.song.name,
              author: widget.song.composer,
              chartComposer: widget.chartComposer,
              songBuffer: songBuffer ?? Uint8List(0),
              quitCallback: () {
                Navigator.pop(context);
              },
            ),
    );
  }
}
