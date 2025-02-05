part of 'trivia_bloc.dart';

enum TimerStatus { initial, running, paused, completed }

class TriviaState extends Equatable {
  final bool isLoading;
  final List<Question> questions;
  final List<Category> categories;
  final int correctAnswers;
  final int remainingTime;
  final TimerStatus timerStatus;
  final bool showingAnswer;
  final bool isGamePaused;

  const TriviaState(
      {this.isLoading = false,
      this.categories = const [],
      this.questions = const [],
      this.correctAnswers = 0,
      this.remainingTime = 60,
      this.timerStatus = TimerStatus.initial,
      this.showingAnswer = false,
      this.isGamePaused = false});

  TriviaState copyWith(
          {bool? isLoading,
          List<Category>? categories,
          List<Question>? questions,
          int? correctAnswers,
          int? remainingTime,
          TimerStatus? timerStatus,
          bool? showingAnswer,
          bool? isGamePaused}) =>
      TriviaState(
          isLoading: isLoading ?? this.isLoading,
          categories: categories ?? this.categories,
          questions: questions ?? this.questions,
          correctAnswers: correctAnswers ?? this.correctAnswers,
          remainingTime: remainingTime ?? this.remainingTime,
          timerStatus: timerStatus ?? this.timerStatus,
          showingAnswer: showingAnswer ?? this.showingAnswer,
          isGamePaused: isGamePaused ?? this.isGamePaused);

  @override
  List<Object> get props => [
        isLoading,
        categories,
        questions,
        correctAnswers,
        remainingTime,
        timerStatus,
        showingAnswer,
        isGamePaused
      ];
}
