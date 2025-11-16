import 'package:flutter/widgets.dart';

abstract class ModeStrategy {
  String getModeName();

  String getModeDescription();

  ImageProvider getModeIcon();

  String getGameName();

  String getDataSourceLocation();

  Map<String, Widget> getRecordViews(String uuid);

  Map<String, Widget> getLibraryViews();

  Map<Icon, Function> getRecordScreenActions();

  Widget getPlayerDetailView(String uuid);
}