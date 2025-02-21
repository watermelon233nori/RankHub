import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_plus/mvvm_plus.dart';
import 'package:rank_hub/src/model/maimai/player_data.dart';
import 'package:rank_hub/src/model/maimai/song_score.dart';
import 'package:rank_hub/src/provider/lx_mai_provider.dart';
import 'package:rank_hub/src/view/maimai/lx_b50_export_view.dart';
import 'package:rank_hub/src/view/maimai/lx_mai_record_card.dart';

class LxB50View extends ViewWidget<LxB50ViewViewModel> {
  LxB50View({super.key}) : super(builder: () => LxB50ViewViewModel());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => viewModel.initialize(),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "当前 RATING",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 40, // 明确的高度
                                child: viewModel.getShaderMaskByRating(
                                  viewModel.playerRating,
                                  AnimatedDigitWidget(
                                    value: viewModel.playerRating,
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "当期版本 Rating: ${viewModel.currentVerRating}"),
                              const SizedBox(height: 16), // 替换 Spacer，避免无约束布局
                              Text("往期版本 Rating: ${viewModel.pastVerRating}"),
                            ],
                          ),
                          const SizedBox(width: 32)
                        ],
                      )
                    ],
                  ),
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => LxB50ExportView(
                                      b35Records: viewModel.b35Records,
                                      b15Records: viewModel.b15Records,
                                      playerData: viewModel.playerData,
                                      playerRating: viewModel.playerRating,
                                      currentVerRating:
                                          viewModel.currentVerRating,
                                      pastVerRating: viewModel.pastVerRating,
                                      getShaderMaskByRating:
                                          viewModel.getShaderMaskByRating,
                                    )),
                          );
                        },
                        child: const Text('导出 B50 成绩图'))),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    '当期版本成绩',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                    height: 280,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 0.6,
                      ),
                      padding: const EdgeInsets.all(16),
                      itemCount: viewModel.b15Records.length,
                      itemBuilder: (context, index) {
                        return LxMaiRecordCard(
                          recordData: viewModel.b15Records[index],
                        );
                      },
                    )),
                const Center(
                  child: Text(
                    '往期版本成绩',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                    height: 280,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 0.6,
                      ),
                      padding: const EdgeInsets.all(16),
                      itemCount: viewModel.b35Records.length,
                      itemBuilder: (context, index) {
                        return LxMaiRecordCard(
                          recordData: viewModel.b35Records[index],
                        );
                      },
                    )),
              ],
            )
          ],
        ));
  }
}

class LxB50ViewViewModel extends ViewModel {
  late PlayerData playerData;

  int playerRating = 0;
  int currentVerRating = 0;
  int pastVerRating = 0;
  List<SongScore> b15Records = [];
  List<SongScore> b35Records = [];

  ShaderMask getShaderMaskByRating(int rating, Widget child) {
    Gradient gradient;

    if (rating < 0) {
      gradient = const LinearGradient(colors: [Colors.grey, Colors.grey]);
    } else if (rating <= 999) {
      gradient = const LinearGradient(colors: [Colors.white, Colors.white]);
    } else if (rating <= 1999) {
      gradient = const LinearGradient(colors: [Colors.blue, Colors.blueAccent]);
    } else if (rating <= 3999) {
      gradient =
          const LinearGradient(colors: [Colors.green, Colors.lightGreen]);
    } else if (rating <= 6999) {
      gradient = const LinearGradient(colors: [Colors.yellow, Colors.orange]);
    } else if (rating <= 9999) {
      gradient = const LinearGradient(colors: [Colors.red, Colors.redAccent]);
    } else if (rating <= 11999) {
      gradient =
          const LinearGradient(colors: [Colors.purple, Colors.deepPurple]);
    } else if (rating <= 12999) {
      gradient = const LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFFB87333)]); // 铜色渐变
    } else if (rating <= 13999) {
      gradient =
          const LinearGradient(colors: [Colors.grey, Colors.blueGrey]); // 银色渐变
    } else if (rating <= 14499) {
      gradient = const LinearGradient(
          colors: [Colors.amber, Colors.orangeAccent]); // 金色渐变
    } else if (rating <= 14999) {
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 252, 208, 122),
        Color.fromARGB(255, 252, 255, 160)
      ]); // 白金渐变
    } else {
      gradient = const LinearGradient(colors: [
        Color.fromARGB(255, 56, 255, 219),
        Color.fromARGB(255, 76, 124, 255),
        Color.fromARGB(255, 244, 92, 255)
      ]); // 彩虹色渐变
    }

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }

  Future<void> initialize() async {
    try {
      await getPlayerRating();
      await initB50();
      await getB15Rating();
      await getB35Rating();
      await getPlayerData();
    } catch (e) {
      // 处理初始化错误
      debugPrint("Initialization error: $e");
    } finally {
      _requestRebuild();
    }
  }

  Future<void> getPlayerData() async {
    playerData =
        await LxMaiProvider().lxApiService.getPlayerData();
  }

  Future<void> initB50() async {
    b15Records =
        await LxMaiProvider().lxApiService.getB15Records();
    b35Records =
        await LxMaiProvider().lxApiService.getB35Records();

    _requestRebuild();
  }

  Future<void> getB15Rating() async {
    int rating = 0;
    for (SongScore record in b15Records) {
      rating += record.dxRating!.truncate();
    }
    currentVerRating = rating;
  }

  Future<void> getB35Rating() async {
    int rating = 0;
    for (SongScore record in b35Records) {
      rating += record.dxRating!.truncate();
    }
    pastVerRating = rating;
  }

  Future<void> getPlayerRating() async {
    playerRating =
        (await LxMaiProvider().lxApiService.getPlayerData())
            .rating;

    _requestRebuild();
  }

  void _requestRebuild() {
    if (context.mounted) {
      notifyListeners();
    }
  }
}
