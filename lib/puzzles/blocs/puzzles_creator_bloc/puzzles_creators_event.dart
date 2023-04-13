part of 'puzzles_creators_bloc.dart';

abstract class PuzzlesCreatorsEvent extends Equatable {
  const PuzzlesCreatorsEvent();

  @override
  List<Object> get props => [];
}

/// Used to emit an updated puzzle item given the updated values
/// eg length of characters, time, no of puzzles etc
class PuzzlesConfigurationEvent extends PuzzlesCreatorsEvent {
  const PuzzlesConfigurationEvent(this.puzzle);

  final Puzzle? puzzle;
}

/// Used to save a puzzle to local database
class PuzzlesCreateEvent extends PuzzlesCreatorsEvent {
  const PuzzlesCreateEvent(this.puzzle);

  final Puzzle puzzle;
}
