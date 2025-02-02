import 'package:flutter/material.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/infrastructure/models/categories_response.dart';

class CategoryMapper {
  static Category castToEntity(TriviaCategory category) {
    return Category(
        id: category.id,
        name: category.name,
        icon: Image.asset('assets/icon_${category.id}.png'));
  }
}
