part of 'puzzles_creators_bloc.dart';

enum PuzzlesCreatorsStateStatus {
  inital,
  success,
  failure,
  loading,
  updated,
}

class PuzzlesCreatorsState extends Equatable {
  const PuzzlesCreatorsState._({
    this.puzzlesCreatorsStateStatus = PuzzlesCreatorsStateStatus.inital,
    this.errorMessage,
    this.puzzle,
  });

  final String? errorMessage;
  final Puzzle? puzzle;
  final PuzzlesCreatorsStateStatus puzzlesCreatorsStateStatus;

  @override
  List<dynamic> get props => <dynamic>[
        puzzlesCreatorsStateStatus,
        errorMessage ?? '',
        puzzle,
      ];

  PuzzlesCreatorsState copyWith({
    PuzzlesCreatorsStateStatus? puzzlesCreatorsStateStatus,
    String? errorMessage,
    Puzzle? puzzle,
  }) {
    return PuzzlesCreatorsState._(
      puzzle: puzzle ?? this.puzzle,
      errorMessage: errorMessage ?? this.errorMessage,
      puzzlesCreatorsStateStatus:
          puzzlesCreatorsStateStatus ?? this.puzzlesCreatorsStateStatus,
    );
  }
}
