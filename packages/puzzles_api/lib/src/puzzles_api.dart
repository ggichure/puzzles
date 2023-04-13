import 'package:puzzles_api/src/models/models.dart';

/// {@template puzzles_api}
/// The interface and models for an API providing access to puzzles and puzzle
/// items.
/// {@endtemplate}
abstract class PuzzlesApi {
  /// {@macro puzzles_api}
  const PuzzlesApi();

  /// Provides a [Stream] of all puzzles.
  Stream<List<Puzzle>?>? streamAllPuzzles(String? puzzleType);

  /// Provides a [Stream] of all puzzleItems.
  Stream<List<PuzzleItem>>? streamPuzzleItems(int puzzleId);

  /// Saves a [puzzle].
  ///
  /// If a [puzzle] with the same id already exists, it will be replaced.
  Future<void> insertPuzzle(Puzzle puzzle);

  /// Saves a [puzzleItem].
  ///
  /// If a [puzzleItem] with the same id already exists, it will be replaced.
  Future<void> savePuzzleItem(PuzzleItem puzzleItem);

  /// Updates a [puzzle].
  ///
  /// If a [puzzle] with the same id already exists, it will be replaced.
  Future<void> updatePuzzle(Puzzle puzzle);

  /// Updates a [puzzleItem].
  ///
  /// If a [puzzleItem] with the same id already exists, it will be replaced.
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem);

  /// Deletes the `puzzle` with the given id.
  ///
  /// Also deletes all related puzzle items
  ///
  /// If no `puzzle` with the given id exists, a [PuzzleNotFoundException] error
  /// isthrown.
  Future<void> deletePuzzle(Puzzle puzzle);

  /// Deletes the `puzzleItem` with the given id.
  ///
  /// If no `puzzleItem` with the given id exists, a
  ///  [PuzzleItemNotFoundException] error is
  /// thrown.
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem);

  /// Gets the `puzzle` with the given id.
  ///

  ///
  /// If no `puzzle` with the given id exists, a [PuzzleNotFoundException] error
  /// isthrown.
  Future<Puzzle?>? getPuzzleById(int id);

  /// Get the `puzzleItem` with the given id.
  ///
  /// If no `puzzleItem` with the given id exists, a
  /// [PuzzleItemNotFoundException] error is
  /// thrown.
  Future<PuzzleItem?>? getPuzzleItemById(int id);

  ///
  //
  /// Insert a puzzleItem
  //

  Future<void> insertPuzzleItem(PuzzleItem puzzleItem);

  /// Get all puzzleItem given puzzle [id]
  //

  Future<List<PuzzleItem>?>? getAllPuzzlesItems(int id);

  /// stream  all puzzleItems given puzzle[id]
  //

  Stream<List<PuzzleItem>?>? streamAllPuzzlesItems(int id);
}

/// Error thrown when a [Puzzle] with a given id is not found.
class PuzzleNotFoundException implements Exception {}

/// Error thrown when a [PuzzleItem] with a given id is not found.
class PuzzleItemNotFoundException implements Exception {}
