import 'package:flutter/material.dart';

class Category {
  final int? id;
  final String name;
  final Image icon;

  const Category({
    required this.icon,
    this.id,
    required this.name,
  });

  static Category defaultCategory() =>
      Category(icon: Image.asset('assets/icon_random.png'), name: 'Any');
}
