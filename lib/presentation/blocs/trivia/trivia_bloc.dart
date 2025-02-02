import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/infrastructure/datasources/triviadb_datasource.dart';
import 'package:quiz_app/infrastructure/repositories/trivia_repository_impl.dart';

part 'trivia_event.dart';
part 'trivia_state.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  final triviaRepository =
      TriviaRepositoryImpl(datasource: TriviaDbDatasource());
  TriviaBloc()
      : super(
          TriviaState(
              categorySelected: Category(
                  icon: Image.asset('assets/icon_random.png'), name: 'Any')),
        ) {
    on<CategoriesLoaded>(
        (event, emit) => emit(state.copyWith(categories: event.categories)));
    _init();
  }

  void _init() async {
    final categories = await triviaRepository.getCategories();
    add(CategoriesLoaded(categories: categories));
  }
}
