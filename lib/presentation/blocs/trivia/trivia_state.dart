part of 'trivia_bloc.dart';

class TriviaState extends Equatable {
  final Category categorySelected;
  final List<Category> categories;

  const TriviaState(
      {this.categories = const [], required this.categorySelected});

  TriviaState copyWith(
          {Category? categorySelected, List<Category>? categories}) =>
      TriviaState(
          categorySelected: categorySelected ?? this.categorySelected,
          categories: categories ?? this.categories);

  @override
  List<Object> get props => [categorySelected, categories];
}
