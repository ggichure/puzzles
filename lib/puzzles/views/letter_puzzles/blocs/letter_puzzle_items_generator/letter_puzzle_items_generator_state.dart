part of 'letter_puzzle_items_generator_bloc.dart';

abstract class LetterPuzzleItemsGeneratorState extends Equatable {
  const LetterPuzzleItemsGeneratorState();

  @override
  List<Object> get props => [];
}

class LetterPuzzleItemsGeneratorInitial
    extends LetterPuzzleItemsGeneratorState {}

class LetterPuzzleItemsGeneratorLoading
    extends LetterPuzzleItemsGeneratorState {}

class LetterPuzzleItemsGeneratorSuccess
    extends LetterPuzzleItemsGeneratorState {
  const LetterPuzzleItemsGeneratorSuccess(this.puzzleItem);

  final PuzzleItem? puzzleItem;
}

class LetterPuzzleItemsGeneratorError extends LetterPuzzleItemsGeneratorState {
  const LetterPuzzleItemsGeneratorError(this.errorMessage);

  final String? errorMessage;
}
