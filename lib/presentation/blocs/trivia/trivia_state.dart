part of 'trivia_bloc.dart';

class TriviaState extends Equatable {
  final bool isLoading;
  final List<Question> questions;
  final List<Category> categories;

  const TriviaState(
      {this.isLoading = false,
      this.categories = const [],
      this.questions = const []});

  TriviaState copyWith(
          {bool? isLoading,
          List<Category>? categories,
          List<Question>? questions}) =>
      TriviaState(
          isLoading: isLoading ?? this.isLoading,
          categories: categories ?? this.categories,
          questions: questions ?? this.questions);

  @override
  List<Object> get props => [isLoading, categories, questions];
}
