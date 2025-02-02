part of 'trivia_bloc.dart';

class TriviaState extends Equatable {
  final bool loadingQuestions;
  final List<Question> questions;
  final List<Category> categories;

  const TriviaState(
      {this.loadingQuestions = false,
      this.categories = const [],
      this.questions = const []});

  TriviaState copyWith(
          {bool? loadingQuestions,
          List<Category>? categories,
          List<Question>? questions}) =>
      TriviaState(
          loadingQuestions: loadingQuestions ?? this.loadingQuestions,
          categories: categories ?? this.categories,
          questions: questions ?? this.questions);

  @override
  List<Object> get props => [loadingQuestions, categories, questions];
}
