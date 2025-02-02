import 'package:quiz_app/domain/entities/category.dart';

abstract class TriviaRespository {
  Future<List<Category>> getCategories();
  // Future<List<>>
}
