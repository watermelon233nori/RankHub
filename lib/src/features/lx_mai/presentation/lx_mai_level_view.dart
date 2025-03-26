import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_types.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_difficulty.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_notes.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/mai_calculate.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/mai_note_table.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/mai_rating_table.dart';
import 'package:url_launcher/url_launcher.dart';

class LxMaiLevelView extends StatefulWidget {
  final SongDifficulty difficulty;
  final String songName;

  const LxMaiLevelView(
      {super.key, required this.difficulty, required this.songName});

  @override
  State<StatefulWidget> createState() => _LxMaiLevelViewState();
}

class _LxMaiLevelViewState extends State<LxMaiLevelView> {
  late ChromeSafariBrowser browser;

  @override
  void initState() {
    super.initState();
    browser = ChromeSafariBrowser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openCalcTool(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        showDragHandle: true,
        builder: (BuildContext ctx) {
          return MaiTapGreatCalculator(notes: widget.difficulty.notes as SongNotes,);
        });
  }

  int noteTableShowMode = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.8),
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.songName,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              '${LevelIndex.fromValue((widget.difficulty.difficulty))} ${widget.difficulty.level} 谱面详情',
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              height: 1,
            )),
        actions: [
          TextButton(
            onPressed: () {
              openCalcTool(context);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calculate),
                SizedBox(width: 4),
                Text("计算工具"),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () async {
                      final keyword =
                          '${widget.songName} ${LevelIndex.fromValue(widget.difficulty.difficulty)} 谱面确认';
                      final url =
                          'bilibili://search?keyword=$keyword'; // 替换为目标应用的 URL Scheme
                      final Uri uri = Uri.parse(url);

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      } else {
                        await browser.open(
                            url: WebUri(
                                "https://search.bilibili.com/video?keyword=$keyword"),
                            settings: ChromeSafariBrowserSettings(
                                presentationStyle:
                                    ModalPresentationStyle.FORM_SHEET,
                                shareState:
                                    CustomTabsShareState.SHARE_STATE_OFF,
                                barCollapsingEnabled: true));
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("在 哔哩哔哩 中搜索谱面确认"),
                        SizedBox(width: 16),
                        Icon(Icons.open_in_new),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '物量统计',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(value: 0, child: Text("0% +")),
                    DropdownMenuItem(value: 1, child: Text("101% -")),
                    DropdownMenuItem(value: 2, child: Text("100% -"))
                  ],
                  value: noteTableShowMode,
                  onChanged: (value) {
                    setState(() {
                      noteTableShowMode = value ?? 0;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 350, // 替换 Expanded，设置固定高度
              child: MaiNoteTable(
                  notes: widget.difficulty.notes as SongNotes,
                  calculateMode: noteTableShowMode),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_left, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "左右滑动查看更多内容",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_right, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 64),
            const Text(
              'DX Rating 对照表',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            MaiRatingTable(level: widget.difficulty.levelValue),
            const SizedBox(height: 64),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "仅供参考，请以游戏内实际数据为准",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
