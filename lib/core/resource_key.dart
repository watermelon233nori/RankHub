import 'package:flutter/material.dart';

@immutable
class ResourceKey<T> {
  final String namespace;
  final String name;
  final String? scope;

  const ResourceKey({required this.namespace, required this.name, this.scope});

  String get fullKey =>
      scope == null ? '$namespace:$name' : '$namespace:$name@$scope';

  @override
  bool operator ==(Object other) =>
      other is ResourceKey &&
      namespace == other.namespace &&
      name == other.name &&
      scope == other.scope;

  @override
  int get hashCode => Object.hash(namespace, name, scope);
}
