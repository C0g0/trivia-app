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
