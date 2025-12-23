import 'package:flutter/material.dart';

@immutable
class PlatformId {
  final String value;

  const PlatformId(this.value);

  @override
  bool operator ==(Object other) => other is PlatformId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
