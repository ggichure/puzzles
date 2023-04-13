part of 'puzzles_get_bloc.dart';

abstract class PuzzlesGetState extends Equatable {
  const PuzzlesGetState();

  @override
  List<Object> get props => [];
}

class PuzzlesGetInitial extends PuzzlesGetState {}

class PuzzlesGetLoading extends PuzzlesGetState {}

class PuzzlesGetError extends PuzzlesGetState {
  const PuzzlesGetError(this.errorMessage);

  final String? errorMessage;
}

class PuzzlesGetSuccess extends PuzzlesGetState {
  const PuzzlesGetSuccess(this.puzzles);

  final List<Puzzle>? puzzles;
}
