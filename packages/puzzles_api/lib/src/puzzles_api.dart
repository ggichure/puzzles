import 'package:puzzles_api/src/models/models.dart';

/// {@template puzzles_api}
/// The interface and models for an API providing access to puzzles and puzzle items.
/// {@endtemplate}
abstract class PuzzlesApi {
  /// {@macro puzzles_api}
  const PuzzlesApi();

  /// Provides a [Stream] of all puzzles.
  Stream<List<Puzzle>>? streamPuzzles();

  /// Provides a [Stream] of all puzzleItems.
  Stream<List<PuzzleItem>>? streamPuzzleItems(int puzzleId);

  /// Saves a [puzzle].
  ///
  /// If a [puzzle] with the same id already exists, it will be replaced.
  Future<void> savePuzzle(Puzzle puzzle);

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
  Future<void> deletePuzzle(int id);

  /// Deletes the `puzzleItem` with the given id.
  ///
  /// If no `puzzleItem` with the given id exists, a [PuzzleItemNotFoundException] error is
  /// thrown.
  Future<void> deletePuzzleItem(int id);

  /// Gets the `puzzle` with the given id.
  ///

  ///
  /// If no `puzzle` with the given id exists, a [PuzzleNotFoundException] error
  /// isthrown.
  Future<void> getPuzzleById(int id);

  /// Get the `puzzleItem` with the given id.
  ///
  /// If no `puzzleItem` with the given id exists, a [PuzzleItemNotFoundException] error is
  /// thrown.
  Future<void> getPPuzzleItemById(int id);
}

/// Error thrown when a [Puzzle] with a given id is not found.
class PuzzleNotFoundException implements Exception {}

/// Error thrown when a [PuzzleItem] with a given id is not found.
class PuzzleItemNotFoundException implements Exception {}
