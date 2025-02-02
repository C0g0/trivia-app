class CategoriesResponse {
  final List<TriviaCategory> triviaCategories;

  CategoriesResponse({
    required this.triviaCategories,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        triviaCategories: List<TriviaCategory>.from(
            json["trivia_categories"].map((x) => TriviaCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trivia_categories":
            List<dynamic>.from(triviaCategories.map((x) => x.toJson())),
      };
}

class TriviaCategory {
  final int id;
  final String name;

  TriviaCategory({
    required this.id,
    required this.name,
  });

  factory TriviaCategory.fromJson(Map<String, dynamic> json) => TriviaCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
