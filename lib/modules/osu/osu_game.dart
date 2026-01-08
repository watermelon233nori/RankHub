import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';

class OsuGame extends IGame {
  @override
  String get id => 'osu';

  @override
  String get name => 'osu!';

  @override
  String get description => 'osu! rhythm game';

  @override
  IconData get icon => Icons.circle_outlined;

  @override
  String? get iconUrl => 'https://osu.ppy.sh/favicon.ico';

  @override
  Color? get color => Colors.pink;

  @override
  bool get isEnabled => true;

  @override
  int get sortOrder => 0;

  @override
  void onSelected() {
    // Optional: Analytics or logic when game is selected
  }

  @override
  Future<void> initialize() async {
    // Initialization logic
  }

  @override
  void dispose() {
    // Cleanup logic
  }

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    // TODO: Implement player info card for osu!
    return null;
  }
}
