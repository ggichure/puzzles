import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

part 'puzzles_get_event.dart';
part 'puzzles_get_state.dart';

class PuzzlesGetBloc extends Bloc<PuzzlesGetEvent, PuzzlesGetState> {
  PuzzlesGetBloc({required PuzzlesRepository puzzlesRepository})
      : _puzzlesRepository = puzzlesRepository,
        super(PuzzlesGetInitial()) {
    on<GetPuzzles>((event, emit) {
      emit.call(PuzzlesGetLoading());

      _puzzlesRepository.streamAllPuzzles(event.puzzleType)?.listen(
        (puzzles) {
          add(GotPuzzles(puzzles));
        },
        // ignore: inference_failure_on_untyped_parameter
        onError: (error) {
          // Handle error, if needed
          emit.call(PuzzlesGetError(error.toString()));
        },
        onDone: () {
          // Handle stream completion, if needed
        },
      );
    });

    on<GotPuzzles>((event, emit) {
      emit(PuzzlesGetSuccess(event.puzzles));
    });
  }

  final PuzzlesRepository _puzzlesRepository;
}