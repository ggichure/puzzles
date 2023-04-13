import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

part 'puzzles_creators_event.dart';
part 'puzzles_creators_state.dart';

/// {@template PuzzlesCreatorsBloc }
///
///[PuzzlesConfigurationEvent]
/// Used to emit an updated puzzle item given the updated values
/// eg length of characters, time, no of puzzles etc
///
/// [PuzzlesCreateEvent] Used to save a puzzle to local database
/// {@endtemplate}
class PuzzlesCreatorsBloc
    extends Bloc<PuzzlesCreatorsEvent, PuzzlesCreatorsState> {
  PuzzlesCreatorsBloc({required PuzzlesRepository puzzlesRepository})
      : _puzzlesRepository = puzzlesRepository,
        super(const PuzzlesCreatorsState._()) {
    on<PuzzlesConfigurationEvent>((event, emit) {
      emit(
        state.copyWith(
          puzzlesCreatorsStateStatus: PuzzlesCreatorsStateStatus.updated,
          puzzle: event.puzzle,
        ),
      );
    });
    on<PuzzlesCreateEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(
            puzzlesCreatorsStateStatus: PuzzlesCreatorsStateStatus.loading,
          ),
        );
        await _puzzlesRepository.insertPuzzle(event.puzzle);
        emit(
          state.copyWith(
            puzzlesCreatorsStateStatus: PuzzlesCreatorsStateStatus.success,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: e.toString(),
            puzzlesCreatorsStateStatus: PuzzlesCreatorsStateStatus.failure,
          ),
        );
      }
    });
  }

  final PuzzlesRepository _puzzlesRepository;
}
