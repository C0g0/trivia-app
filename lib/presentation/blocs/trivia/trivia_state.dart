part of 'trivia_bloc.dart';

class TriviaState extends Equatable {
  final bool isLoading;
  final List<Question> questions;
  final List<Category> categories;
  final int correctAnswers;

  const TriviaState(
      {this.isLoading = false,
      this.categories = const [],
      this.questions = const [],
      this.correctAnswers = 0});

  TriviaState copyWith(
          {bool? isLoading,
          List<Category>? categories,
          List<Question>? questions,
          int? correctAnswers}) =>
      TriviaState(
          isLoading: isLoading ?? this.isLoading,
          categories: categories ?? this.categories,
          questions: questions ?? this.questions,
          correctAnswers: correctAnswers ?? this.correctAnswers);

  @override
  List<Object> get props => [isLoading, categories, questions, correctAnswers];
}
