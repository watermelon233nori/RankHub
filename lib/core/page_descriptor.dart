import 'package:flutter/material.dart';

class PageDescriptor {
  final String title;
  final IconData icon;
  final WidgetBuilder builder;

  const PageDescriptor({
    required this.title,
    required this.icon,
    required this.builder,
  });
}
