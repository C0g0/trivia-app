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
  }
}
