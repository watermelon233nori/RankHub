import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rank_hub/games/maimai/maimai_providers.dart';
import 'package:rank_hub/games/maimai/models/maimai_song.dart';
import 'package:rank_hub/games/maimai/models/maimai_score.dart';
import 'package:rank_hub/games/maimai/models/enums/level_index.dart';
import 'package:rank_hub/games/maimai/models/enums/song_type.dart';
import 'package:rank_hub/games/maimai/models/enums/fc_type.dart';
import 'package:rank_hub/games/maimai/models/enums/fs_type.dart';

/// 谱面难度卡片组件
class DifficultyCard extends ConsumerWidget {
  final dynamic difficulty; // SongDifficulty or SongDifficultyUtage
  final int songId;
  final String songName;
  final String version;
  final bool isUtage;

  const DifficultyCard({
    super.key,
    required this.difficulty,
    required this.songId,
    required this.songName,
    required this.version,
    this.isUtage = false,
  });

  List<String> _splitLevelValue() {
    return difficulty.levelValue.toStringAsFixed(1).split('.');
  }

  Color _getCardBgColor() {
    switch (difficulty.difficulty) {
      case LevelIndex.basic:
        return Colors.green.shade600;
      case LevelIndex.advanced:
        return Colors.yellow.shade800;
      case LevelIndex.expert:
        return Colors.red.shade600;
      case LevelIndex.master:
        return Colors.purple.shade600;
      case LevelIndex.reMaster:
        return Colors.purple.shade300;
      default:
        return Colors.blue.shade600;
    }
  }

  Color _getCardBorderColor() {
    switch (difficulty.difficulty) {
      case LevelIndex.basic:
        return Colors.green.shade900;
      case LevelIndex.advanced:
        return Colors.yellow.shade900;
      case LevelIndex.expert:
        return Colors.red.shade900;
      case LevelIndex.master:
        return Colors.purple.shade900;
      case LevelIndex.reMaster:
        return Colors.purple.shade600;
      default:
        return Colors.blue.shade900;
    }
  }

  MaterialColor _getTypeColor(SongType type) {
    if (type == SongType.standard) {
      return Colors.blue;
    } else if (type == SongType.dx) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  List<String> _splitAchievements(MaimaiScore? playerScore) {
    if (playerScore == null) {
      return ['0', '0000'];
    }
    return playerScore.achievements.toStringAsFixed(4).split('.');
  }

  MaterialColor _getFcColor(FCType fc) {
    switch (fc) {
      case FCType.fc:
      case FCType.fcPlus:
        return Colors.green;
      case FCType.ap:
      case FCType.apPlus:
        return Colors.orange;
    }
  }

  String _getFcText(FCType fc) {
    switch (fc) {
      case FCType.fc:
        return 'FC';
      case FCType.fcPlus:
        return 'FC+';
      case FCType.ap:
        return 'AP';
      case FCType.apPlus:
        return 'AP+';
    }
  }

  MaterialColor _getFsColor(FSType fs) {
    switch (fs) {
      case FSType.sync:
        return Colors.lightBlue;
      case FSType.fs:
      case FSType.fsPlus:
        return Colors.blue;
      case FSType.fsd:
      case FSType.fsdPlus:
        return Colors.orange;
    }
  }

  String _getFsText(FSType fs) {
    switch (fs) {
      case FSType.sync:
        return 'SYNC';
      case FSType.fs:
        return 'FS';
      case FSType.fsPlus:
        return 'FS+';
      case FSType.fsd:
        return 'FSD';
      case FSType.fsdPlus:
        return 'FSD+';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficultyColor = _getCardBgColor();
    final borderColor = _getCardBorderColor();
    final typeLabel = difficulty.type == SongType.dx ? 'DX' : '标准';
    final typeColor = _getTypeColor(difficulty.type);

    final playerScore = ref.watch(maimaiScoreByIdProvider(songId));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor, width: 4),
        ),
        color: difficultyColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.go('/maimai/song/$songId/${difficulty.difficulty.label}');
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      difficulty.difficulty.label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _splitLevelValue()[0],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '.${_splitLevelValue()[1]}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (difficulty.levelValue % 1 > 0.5)
                      Transform.translate(
                        offset: const Offset(4, -8),
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const Spacer(),
                    Chip(
                      side: BorderSide(width: 2, color: typeColor.shade700),
                      label: Text(
                        typeLabel,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: typeColor,
                    ),
                  ],
                ),
                const Opacity(opacity: 0.6, child: Divider()),
                // 玩家成绩信息
                if (playerScore != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // 达成率
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '达成率',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: _splitAchievements(playerScore)[0],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '.${_splitAchievements(playerScore)[1]}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '%',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // FC 标记
                      if (playerScore.fc != null) ...[
                        Chip(
                          side: BorderSide(
                            width: 2,
                            color: _getFcColor(playerScore.fc!).shade700,
                          ),
                          label: Text(
                            _getFcText(playerScore.fc!),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: _getFcColor(playerScore.fc!),
                        ),
                        const SizedBox(width: 8),
                      ],
                      // FS 标记
                      if (playerScore.fs != null)
                        Chip(
                          side: BorderSide(
                            width: 2,
                            color: _getFsColor(playerScore.fs!).shade700,
                          ),
                          label: Text(
                            _getFsText(playerScore.fs!),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: _getFsColor(playerScore.fs!),
                        ),
                    ],
                  ),
                  const Opacity(opacity: 0.6, child: Divider()),
                ],
                const SizedBox(height: 8),
                // 谱师和版本信息
                Row(
                  children: [
                    const Text('谱师: '),
                    Expanded(
                      child: Text(
                        difficulty.noteDesigner.isEmpty
                            ? '-'
                            : difficulty.noteDesigner,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('版本: ', style: TextStyle(color: Colors.white)),
                    Text(
                      version.isEmpty ? '-' : version,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // 宴会场特殊信息
                if (isUtage && difficulty is MaimaiSongDifficultyUtage) ...[
                  const SizedBox(height: 8),
                  if ((difficulty as MaimaiSongDifficultyUtage)
                      .kanji
                      .isNotEmpty)
                    Chip(
                      label: Text(
                        (difficulty as MaimaiSongDifficultyUtage).kanji,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.purple,
                      side: BorderSide(color: Colors.purple.shade700, width: 2),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
