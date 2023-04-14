import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:words_generator_repository/words_generator_repository.dart';

part 'letter_puzzle_items_generator_event.dart';
part 'letter_puzzle_items_generator_state.dart';

/// used to generate letter puzzle items
class LetterPuzzleItemsGeneratorBloc extends Bloc<
    LetterPuzzleItemsGeneratorEvent, LetterPuzzleItemsGeneratorState> {
  LetterPuzzleItemsGeneratorBloc({
    required WordsGeneratorRepository wordsGeneratorRepository,
  })  : _wordsGeneratorRepository = wordsGeneratorRepository,
        super(LetterPuzzleItemsGeneratorInitial()) {
    on<GenerateLetterPuzzleItem>((event, emit) async {
      try {
        emit.call(LetterPuzzleItemsGeneratorLoading());
        final choices = await _wordsGeneratorRepository
            .randomWordsGenerator(event.puzzle?.lengthOfCharacters);
        emit.call(
          LetterPuzzleItemsGeneratorSuccess(
            PuzzleItem(
              choices: choices,
              createdAt: DateTime.now().toIso8601String(),
              puzzleId: event.puzzle?.id,
              puzzleType: event.puzzle?.puzzleType,
            ),
          ),
        );
      } catch (e) {
        emit.call(LetterPuzzleItemsGeneratorError(e.toString()));
      }
    });
  }
  final WordsGeneratorRepository _wordsGeneratorRepository;
}
