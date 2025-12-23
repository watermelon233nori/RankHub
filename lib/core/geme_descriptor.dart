import 'package:rank_hub/core/page_descriptor.dart';
import 'package:rank_hub/core/data_definition.dart';

class GameDescriptor {
  final List<PageDescriptor> libraryPages;
  final List<PageDescriptor> scorePages;
  final List<PageDescriptor> toolboxPages;
  final List<PageDescriptor> profilePages;

  final List<GameResourceDefinition> resources;
  final List<GameToolDefinition> tools;

  const GameDescriptor({
    required this.libraryPages,
    required this.scorePages,
    required this.toolboxPages,
    required this.profilePages,
    required this.resources,
    required this.tools,
  });
}
