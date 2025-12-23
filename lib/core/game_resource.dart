import 'package:rank_hub/core/data_definition.dart';
import 'package:rank_hub/core/resource_key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ResourceState<T> = AsyncValue<T>;

abstract class ResourceRegistry {
  GameResourceDefinition<T>? find<T>(ResourceKey key);
}
