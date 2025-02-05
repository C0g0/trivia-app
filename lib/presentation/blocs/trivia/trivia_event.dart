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

class UpdateRemainingTime extends TriviaEvent {
  final int newRemainingTime;
  final TimerStatus timerStatus;
  const UpdateRemainingTime(
      {required this.timerStatus, required this.newRemainingTime});
}

class ResetCorrectAnswers extends TriviaEvent {
  const ResetCorrectAnswers();
}

class ShowingAnswer extends TriviaEvent {
  const ShowingAnswer();
}

class GamePaused extends TriviaEvent {
  final bool isGamePaused;
  const GamePaused(this.isGamePaused);
}
