part of 'trivia_bloc.dart';

enum TimerStatus { initial, running, paused, completed }

class TriviaState extends Equatable {
  final bool isLoading;
  final List<Question> questions;
  final List<Category> categories;
  final int correctAnswers;
  final int remainingTime;
  final TimerStatus timerStatus;

  const TriviaState(
      {this.isLoading = false,
      this.categories = const [],
      this.questions = const [],
      this.correctAnswers = 0,
      this.remainingTime = 60,
      this.timerStatus = TimerStatus.initial});

  TriviaState copyWith(
          {bool? isLoading,
          List<Category>? categories,
          List<Question>? questions,
          int? correctAnswers,
          int? remainingTime,
          TimerStatus? timerStatus}) =>
      TriviaState(
          isLoading: isLoading ?? this.isLoading,
          categories: categories ?? this.categories,
          questions: questions ?? this.questions,
          correctAnswers: correctAnswers ?? this.correctAnswers,
          remainingTime: remainingTime ?? this.remainingTime,
          timerStatus: timerStatus ?? this.timerStatus);

  @override
  List<Object> get props => [
        isLoading,
        categories,
        questions,
        correctAnswers,
        remainingTime,
        timerStatus
      ];
}
