import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:rank_hub/src/model/maimai/player_data.dart';
import 'package:rank_hub/src/model/maimai/song_score.dart';
import 'package:rank_hub/src/view/maimai/lx_mai_record_card.dart';

class LxB50ExportView extends StatelessWidget {
  final List<SongScore> b35Records;
  final List<SongScore> b15Records;
  final PlayerData playerData;
  final int playerRating;
  final int currentVerRating;
  final int pastVerRating;
  final Function(int, Widget) getShaderMaskByRating;

  LxB50ExportView(
      {super.key,
      required this.b35Records,
      required this.b15Records,
      required this.playerData,
      required this.playerRating,
      required this.currentVerRating,
      required this.pastVerRating,
      required this.getShaderMaskByRating});

  final GlobalKey combinedKey = GlobalKey();

  Future<void> _saveToGallery(Uint8List pngBytes) async {
    final result = await ImageGallerySaverPlus.saveImage(
      Uint8List.fromList(pngBytes),
      quality: 100,
      name: "B15_B35_Scores",
    );
    print("Image saved to gallery: $result");
  }

  Future<void> _generateAndSaveImage() async {
    try {
      RenderRepaintBoundary boundary = combinedKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image =
          await boundary.toImage(pixelRatio: 7.0); // High-quality scaling
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      await _saveToGallery(pngBytes);
    } catch (e) {
      print("Error generating or saving image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    const int b15RowCount = 5; // Number of columns for B15
    const int b35RowCount = 5; // Number of columns for B35

    final b15Height = (b15Records.length / b15RowCount).ceil() * 240;
    final b35Height = (b35Records.length / b35RowCount).ceil() * 240;

    final totalHeight = b15Height + b35Height + 1000; // Add padding for labels

    return Scaffold(
        appBar: AppBar(
          title: const Text('导出 B50 成绩图'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _generateAndSaveImage,
            ),
          ],
        ),
        body: RepaintBoundary(
          key: combinedKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/maimai_bud.jpg'), // Background image
                fit: BoxFit.cover, // Cover the entire area
              ),
            ),
            child: Center(
              child: FittedBox(
                child: SizedBox(
                  width: 1832, // Fixed width for clarity in images
                  height: totalHeight.toDouble(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 72),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: SizedBox(
                                width: 1000,
                                height: 160,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      // 背景容器，显示牌面图和渐变效果
                                      Positioned.fill(
                                        child: ShaderMask(
                                          shaderCallback: (bounds) =>
                                              LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.black.withOpacity(0.7),
                                              Colors.transparent,
                                            ],
                                            tileMode: TileMode.clamp,
                                          ).createShader(bounds),
                                          blendMode: BlendMode.srcOver,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://assets.lxns.net/maimai/plate/${playerData.namePlate?.id}.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // 玩家信息 (头像和文字)
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(16),
                                            leading: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://assets.lxns.net/maimai/icon/${playerData.icon?.id}.png',
                                                fit: BoxFit.cover,
                                                fadeInDuration: const Duration(
                                                    milliseconds: 500),
                                                placeholder: (context, url) =>
                                                    Transform.scale(
                                                  scale: 0.4,
                                                  child:
                                                      const CircularProgressIndicator(),
                                                ),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    const Icon(Icons
                                                        .image_not_supported),
                                              ),
                                            ),
                                            title: Text(
                                              playerData.name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 48),
                                            ), // 玩家姓名
                                            subtitle: const Text(
                                              '  舞萌 DX B50 成绩图',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                          const Spacer(),
                          Padding(
                              padding: const EdgeInsets.only(right: 32),
                              child: SizedBox(
                                  width: 400,
                                  height: 160,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 32),
                                        Row(
                                          children: [
                                            const SizedBox(width: 32),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "当前 RATING",
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 16),
                                                SizedBox(
                                                  height: 40, // 明确的高度
                                                  child: getShaderMaskByRating(
                                                    playerRating,
                                                    Text(
                                                      playerRating.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "当期版本 Rating: $currentVerRating"),
                                                const SizedBox(
                                                    height:
                                                        16), // 替换 Spacer，避免无约束布局
                                                Text(
                                                    "往期版本 Rating: $pastVerRating"),
                                              ],
                                            ),
                                            const SizedBox(width: 16)
                                          ],
                                        )
                                      ],
                                    ),
                                  )))
                        ],
                      ),
                      const SizedBox(height: 128),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const ui.Color.fromARGB(255, 40, 40, 40),
                            borderRadius: BorderRadius.circular(48),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: const Text(
                            "  当期版本成绩 B15  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // B15 Grid
                      SizedBox(
                          height: 740,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisExtent: 240,
                              childAspectRatio: 1.3,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(16),
                            itemCount: b15Records.length,
                            itemBuilder: (context, index) {
                              return LxMaiRecordCard(
                                recordData: b15Records[index],
                              );
                            },
                          )),
                      // B35 Grid

                      const SizedBox(height: 72),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const ui.Color.fromARGB(255, 40, 40, 40),
                            borderRadius: BorderRadius.circular(48),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: const Text(
                            "  往期版本成绩 B35  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1800,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisExtent: 240,
                            childAspectRatio: 1.3,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          itemCount: b35Records.length,
                          itemBuilder: (context, index) {
                            return LxMaiRecordCard(
                              recordData: b35Records[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 72),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const ui.Color.fromARGB(255, 40, 40, 40),
                            borderRadius: BorderRadius.circular(48),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: const Text(
                            "  本图使用 RankHub App 生成  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
