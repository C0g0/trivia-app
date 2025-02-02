import 'package:quiz_app/domain/entities/category.dart';

abstract class TriviaDatasource {
  Future<List<Category>> getCategories();
  // Future<List<>>
}
