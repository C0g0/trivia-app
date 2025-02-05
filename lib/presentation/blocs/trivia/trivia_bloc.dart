import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

import 'package:quiz_app/domain/entities/entities.dart';
import 'package:quiz_app/infrastructure/datasources/triviadb_datasource.dart';
import 'package:quiz_app/infrastructure/repositories/trivia_repository_impl.dart';

part 'trivia_event.dart';
part 'trivia_state.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  final triviaRepository =
      TriviaRepositoryImpl(datasource: TriviaDbDatasource());

  late StreamSubscription<int> _timerSubscription;
  final int _remainingTime = 60;

  TriviaBloc()
      : super(
          const TriviaState(),
        ) {
    on<CategoriesLoaded>((event, emit) => emit(state.copyWith(
        categories: event.categories, isLoading: !state.isLoading)));

    on<LoadQuestions>((event, emit) async {
      emit(state.copyWith(
          questions: event.questions, isLoading: !state.isLoading));
    });

    on<Loading>(
      (event, emit) => emit(state.copyWith(isLoading: !state.isLoading)),
    );

    on<NewCorrectAnswer>((event, emit) =>
        emit(state.copyWith(correctAnswers: state.correctAnswers + 1)));

    on<ShowingAnswer>((event, emit) {
      emit(state.copyWith(showingAnswer: !state.showingAnswer));
    });

    on<GamePaused>((event, emit) {
      emit(state.copyWith(isGamePaused: event.isGamePaused));
    });

    on<ResetCorrectAnswers>((event, emit) {
      emit(state.copyWith(correctAnswers: 0));
    });

    on<UpdateRemainingTime>((event, emit) => emit(state.copyWith(
        remainingTime: event.newRemainingTime,
        timerStatus: event.timerStatus)));

    _init();
  }

  void _init() async {
    add(const Loading());
    final categories = await triviaRepository.getCategories();
    add(CategoriesLoaded(categories: categories));
  }

  Future<void> loadQuestions(
      String categoryId, String dificulty, BuildContext context) async {
    add(const Loading());
    final List<Question> questions = await triviaRepository.getQuestions(
      categoryId: categoryId,
      dificulty: dificulty,
    );
    add(LoadQuestions(questions: questions));
    _startTimer();
  }

  void _startTimer() {
    _timerSubscription = Stream.periodic(
            const Duration(seconds: 1), (count) => _remainingTime - count - 1)
        .take(_remainingTime)
        .listen((timeLeft) {
      if (timeLeft > 0) {
        add(UpdateRemainingTime(
            newRemainingTime: timeLeft, timerStatus: TimerStatus.running));
      } else {
        add(const UpdateRemainingTime(
            newRemainingTime: 00, timerStatus: TimerStatus.completed));
      }
    });
  }

  void pauseResumeTimer() {
    if (state.timerStatus == TimerStatus.running) {
      _timerSubscription.pause();

      add(UpdateRemainingTime(
          timerStatus: TimerStatus.paused,
          newRemainingTime: state.remainingTime));
    } else if (state.timerStatus == TimerStatus.paused) {
      add(UpdateRemainingTime(
          timerStatus: TimerStatus.running,
          newRemainingTime: state.remainingTime));
      _timerSubscription.resume();
      add(const GamePaused(false));
    }
  }

  void pauseGame() {
    add(const GamePaused(true));
  }

  void cancelTimer() {
    _timerSubscription.cancel();
    add(const UpdateRemainingTime(
        timerStatus: TimerStatus.initial, newRemainingTime: 60));
  }

  @override
  Future<void> close() {
    _timerSubscription.cancel();
    return super.close();
  }
}
