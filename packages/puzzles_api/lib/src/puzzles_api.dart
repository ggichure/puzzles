import 'package:puzzles_api/src/models/models.dart';

/// {@template puzzles_api}
/// The interface and models for an API providing access to puzzles saved locally.
/// {@endtemplate}
abstract class PuzzlesApi {
  /// {@macro puzzles_api}
  const PuzzlesApi();

  /// Provides a [Stream ] of all Puzzles
  Stream<List<PuzzlesModel>> getPuzzles();

  /// Provides a [Stream ] of all PuzzlesItems give [puzzleId]
  Stream<List<PuzzlesItemModel>> getPuzzlesItems(int? puzzleId);

  /// Saves a [puzzlesModel]
  ///
  /// On conflict update
  Future<void> savePuzzle(PuzzlesModel? puzzlesModel);

  /// saves a [puzzlesItemModel]
  ///
  /// On conflict update
  Future<void> savePuzzleItem(PuzzlesItemModel? puzzlesItemModel);

  /// delete a PuzzlesModel given its [id]
  ///
  /// This also deletes the puzzle items
  ///
  /// If no `puzzle` with the given id exists, a [PuzzleNotFoundException]
  /// error is thrown.
  Future<void> deletePuzzle(int? id);

  /// delete a PuzzlesItemModel given its [id] and a [puzzleId]
  ///
  /// If no `puzzle` with the given id exists, a [PuzzleItemsNotFoundException]
  /// error is thrown.
  Future<void> deletePuzzleItem({required int? id, required int? puzzleId});

  /// Deletes all puzzles and puzzle items
  Future<void> deleteALlPuzzles();
}

/// Error thrown when a [PuzzlesModel] with a given id is not found.
class PuzzleNotFoundException implements Exception {}

/// Error thrown when a [PuzzlesItemModel] with a given id is not found.
class PuzzleItemsNotFoundException implements Exception {}
