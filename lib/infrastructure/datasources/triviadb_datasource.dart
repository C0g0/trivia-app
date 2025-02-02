import 'package:dio/dio.dart';
import 'package:quiz_app/domain/datasources/trivia_datasource.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/infrastructure/mappers/category_mapper.dart';
import 'package:quiz_app/infrastructure/models/categories_response.dart';

class TriviaDbDatasource extends TriviaDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://opentdb.com/'));

  @override
  Future<List<Category>> getCategories() async {
    final response = await dio.get('api_category.php');
    final CategoriesResponse categoriesResponse =
        CategoriesResponse.fromJson(response.data);

    final List<Category> categories = categoriesResponse.triviaCategories
        .map((category) => CategoryMapper.castToEntity(category))
        .toList();
    return categories;
  }
}
