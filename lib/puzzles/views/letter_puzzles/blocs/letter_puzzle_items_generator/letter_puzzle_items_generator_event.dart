part of 'letter_puzzle_items_generator_bloc.dart';

abstract class LetterPuzzleItemsGeneratorEvent extends Equatable {
  const LetterPuzzleItemsGeneratorEvent();

  @override
  List<Object> get props => [];
}

class GenerateLetterPuzzleItem extends LetterPuzzleItemsGeneratorEvent {
  const GenerateLetterPuzzleItem(this.puzzle);

  final Puzzle? puzzle;
}
