import 'package:quiz_app/domain/entities/entities.dart';

abstract class TriviaRespository {
  Future<List<Category>> getCategories();
  Future<List<Question>> getQuestions({String categoryId, String dificulty});
}
