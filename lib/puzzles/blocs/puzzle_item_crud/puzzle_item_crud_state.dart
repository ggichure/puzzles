part of 'puzzle_item_crud_bloc.dart';

abstract class PuzzleItemCrudState extends Equatable {
  const PuzzleItemCrudState();

  @override
  List<Object> get props => [];
}

class PuzzleItemCrudInitial extends PuzzleItemCrudState {}

class PuzzleItemCrudLoading extends PuzzleItemCrudState {}

class PuzzleItemCrudSuccess extends PuzzleItemCrudState {}

class PuzzleItemCrudError extends PuzzleItemCrudState {
  const PuzzleItemCrudError(this.errorMessage);

  final String? errorMessage;
}
