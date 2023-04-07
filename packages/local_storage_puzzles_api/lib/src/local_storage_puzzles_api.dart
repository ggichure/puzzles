import 'package:local_storage_puzzles_api/src/database/daos/puzzle_items_dao.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzles_dao.dart';
import 'package:puzzles_api/puzzles_api.dart';

/// {@template local_storage_puzzles_api}
/// A Flutter implementation of the PuzzlesApi that uses local storage.
/// {@endtemplate}
class LocalStoragePuzzlesApi {
  /// {@macro local_storage_puzzles_api}
  const LocalStoragePuzzlesApi({
    required PuzzlesDao puzzlesDao,
    required PuzzlesItemDao puzzlesItemDao,
  })  : _puzzlesDao = puzzlesDao,
        _puzzlesItemDao = puzzlesItemDao;

  final PuzzlesDao _puzzlesDao;
  final PuzzlesItemDao _puzzlesItemDao;

  /// Insert a puzzle
  Future<void> insertPuzzle(Puzzle puzzle) => _puzzlesDao.insertPuzzle(puzzle);

  /// Update a puzzle
  Future<void> updatePuzzle(Puzzle puzzle) => _puzzlesDao.updatePuzzle(puzzle);

  /// Delete a puzzle
  Future<void> deletePuzzle(Puzzle puzzle) => _puzzlesDao.deletePuzzle(puzzle);

  /// Get all puzzles
  Future<List<Puzzle>?>? getAllPuzzles() => _puzzlesDao.getAllPuzzles();

  /// stream  all puzzles
  Stream<List<Puzzle>?>? streamAllPuzzles() => _puzzlesDao.streamAllPuzzles();

  /// Get a puzzle by id
  Future<Puzzle?>? getPuzzleById(int id) => _puzzlesDao.getPuzzleById(id);

  ///======== PUZZLEITEMS=============
  ///
  //
  /// Insert a puzzleItem
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.insertPuzzleItem(puzzleItem);

  /// Update a puzzleItem
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.updatePuzzleItem(puzzleItem);

  /// Delete a puzzleItem given [puzzleItem]
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.deletePuzzleItem(puzzleItem);

  /// Get all puzzleItem given puzzle [id]
  Future<List<PuzzleItem>?>? getAllPuzzlesItems(int id) =>
      _puzzlesItemDao.getAllPuzzlesItems(id);

  /// stream  all puzzleItems given puzzle[id]
  Stream<List<PuzzleItem>?>? streamAllPuzzlesItems(int id) =>
      _puzzlesItemDao.streamAllPuzzlesItems(id);

  /// Get a puzzleItem by id
  Future<PuzzleItem?>? getPuzzleItemById(int id) =>
      _puzzlesItemDao.getPuzzleItemById(id);
}
