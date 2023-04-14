part of 'puzzle_item_crud_bloc.dart';

abstract class PuzzleItemCrudEvent extends Equatable {
  const PuzzleItemCrudEvent();

  @override
  List<Object> get props => [];
}

class InsertAPuzzleItem extends PuzzleItemCrudEvent {
  const InsertAPuzzleItem(this.puzzleItem);

  final PuzzleItem? puzzleItem;
}
