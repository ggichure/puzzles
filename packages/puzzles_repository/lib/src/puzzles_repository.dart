import 'package:local_storage_puzzles_api/local_storage_puzzles_api.dart';
import 'package:puzzles_api/puzzles_api.dart';

/// {@template puzzles_repository}
/// A repository that handles puzzles  related requests.
/// {@endtemplate}
class PuzzlesRepository {
  /// {@macro puzzles_repository}
  const PuzzlesRepository({
    required LocalStoragePuzzlesApi localStoragePuzzlesApi,
  }) : _localStoragePuzzlesApi = localStoragePuzzlesApi;
  final LocalStoragePuzzlesApi _localStoragePuzzlesApi;

  /// Insert a puzzle
  Future<void> insertPuzzle(Puzzle puzzle) =>
      _localStoragePuzzlesApi.insertPuzzle(puzzle);

  /// Update a puzzle
  Future<void> updatePuzzle(Puzzle puzzle) =>
      _localStoragePuzzlesApi.updatePuzzle(puzzle);

  /// Delete a puzzle
  Future<void> deletePuzzle(Puzzle puzzle) =>
      _localStoragePuzzlesApi.deletePuzzle(puzzle);

  /// Get all puzzles
  Future<List<Puzzle>?>? getAllPuzzles() =>
      _localStoragePuzzlesApi.getAllPuzzles();

  /// stream  all puzzles
  Stream<List<Puzzle>?>? streamAllPuzzles() =>
      _localStoragePuzzlesApi.streamAllPuzzles();

  /// Get a puzzle by id
  Future<Puzzle?>? getPuzzleById(int id) =>
      _localStoragePuzzlesApi.getPuzzleById(id);

  ///======== PUZZLEITEMS=============
  ///
  //
  /// Insert a puzzleItem
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) =>
      _localStoragePuzzlesApi.insertPuzzleItem(puzzleItem);

  /// Update a puzzleItem
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) =>
      _localStoragePuzzlesApi.updatePuzzleItem(puzzleItem);

  /// Delete a puzzleItem given [puzzleItem]
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) =>
      _localStoragePuzzlesApi.deletePuzzleItem(puzzleItem);

  /// Get all puzzleItem given puzzle [id]
  Future<List<PuzzleItem>?>? getAllPuzzlesItems(int id) =>
      _localStoragePuzzlesApi.getAllPuzzlesItems(id);

  /// stream  all puzzleItems given puzzle[id]
  Stream<List<PuzzleItem>?>? streamAllPuzzlesItems(int id) =>
      _localStoragePuzzlesApi.streamAllPuzzlesItems(id);

  /// Get a puzzleItem by id
  Future<PuzzleItem?>? getPuzzleItemById(int id) =>
      _localStoragePuzzlesApi.getPuzzleItemById(id);
}
