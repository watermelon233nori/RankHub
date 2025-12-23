import 'package:rank_hub/core/game.dart';
import 'package:rank_hub/core/game_id.dart';
import 'package:rank_hub/core/geme_descriptor.dart';

class Maimai extends Game {
  @override
  final GameId id = GameId(
    name: "舞萌 DX",
    version: "1.51-I",
    platform: "arcade",
    region: "CN",
  );

  @override
  GameDescriptor get descriptor => GameDescriptor(
    libraryPages: [],
    scorePages: [],
    toolboxPages: [],
    profilePages: [],
    resources: [],
    tools: [],
  );

  @override
  String get name => "舞萌 DX";
}
