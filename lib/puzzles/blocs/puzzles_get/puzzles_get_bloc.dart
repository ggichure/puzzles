import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

part 'puzzles_get_event.dart';
part 'puzzles_get_state.dart';

class PuzzlesGetBloc extends Bloc<PuzzlesGetEvent, PuzzlesGetState> {
  PuzzlesGetBloc(this._puzzlesRepository) : super(PuzzlesGetInitial()) {
    on<GetPuzzles>((event, emit) {
      emit.call(PuzzlesGetLoading());
      _puzzlesRepository.streamAllPuzzles(event.puzzleType)?.listen((puzzles) {
        add(GotPuzzles(puzzles));
      });
    });

    on<GotPuzzles>((event, emit) {
      emit(PuzzlesGetSuccess(event.puzzles));
    });
  }

  final PuzzlesRepository _puzzlesRepository;
}
