part of 'puzzles_get_bloc.dart';

abstract class PuzzlesGetEvent extends Equatable {
  const PuzzlesGetEvent();

  @override
  List<Object> get props => [];
}

class GetPuzzles extends PuzzlesGetEvent {
  const GetPuzzles(this.puzzleType);

  final String? puzzleType;
}

class GotPuzzles extends PuzzlesGetEvent {
  const GotPuzzles(this.puzzles);

  final List<Puzzle>? puzzles;
}
