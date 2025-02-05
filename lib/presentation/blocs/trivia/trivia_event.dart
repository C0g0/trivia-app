part of 'trivia_bloc.dart';

class TriviaEvent extends Equatable {
  const TriviaEvent();

  @override
  List<Object> get props => [];
}

class CategoriesLoaded extends TriviaEvent {
  final List<Category> categories;

  const CategoriesLoaded({required this.categories});
}

class LoadQuestions extends TriviaEvent {
  final List<Question> questions;

  const LoadQuestions({required this.questions});
}

class Loading extends TriviaEvent {
  const Loading();
}

class NewCorrectAnswer extends TriviaEvent {
  const NewCorrectAnswer();
}
