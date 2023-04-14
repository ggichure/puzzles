import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

part 'puzzle_item_crud_event.dart';
part 'puzzle_item_crud_state.dart';

class PuzzleItemCrudBloc
    extends Bloc<PuzzleItemCrudEvent, PuzzleItemCrudState> {
  PuzzleItemCrudBloc({required PuzzlesRepository puzzlesRepository})
      : _puzzlesRepository = puzzlesRepository,
        super(PuzzleItemCrudInitial()) {
    on<InsertAPuzzleItem>((event, emit) async {
      try {
        emit.call(PuzzleItemCrudLoading());

        await _puzzlesRepository.insertPuzzleItem(event.puzzleItem!);
        emit.call(PuzzleItemCrudSuccess());
      } catch (e) {
        emit.call(PuzzleItemCrudError(e.toString()));
      }
    });
  }

  final PuzzlesRepository _puzzlesRepository;
}
