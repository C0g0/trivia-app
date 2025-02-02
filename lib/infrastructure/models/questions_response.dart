import 'package:quiz_app/domain/entities/entities.dart';

class QuestionsResponse {
  final int responseCode;
  final List<Question> results;

  QuestionsResponse({
    required this.responseCode,
    required this.results,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      QuestionsResponse(
        responseCode: json["response_code"],
        results: List<Question>.from(
            json["results"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
