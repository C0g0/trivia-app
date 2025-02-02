import 'package:quiz_app/domain/datasources/trivia_datasource.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/domain/entities/question.dart';
import 'package:quiz_app/domain/repositories/trivia_respository.dart';

class TriviaRepositoryImpl extends TriviaRespository {
  final TriviaDatasource datasource;

  TriviaRepositoryImpl({required this.datasource});

  @override
  Future<List<Category>> getCategories() {
    return datasource.getCategories();
  }

  @override
  Future<List<Question>> getQuestions(
      {String categoryId = '', String dificulty = 'easy'}) {
    return datasource.getQuestions(categoryId, dificulty);
  }
}
