import 'package:local_storage_puzzles_api/src/database/daos/puzzle_items_dao.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzles_dao.dart';
import 'package:puzzles_api/puzzles_api.dart';

/// {@template local_storage_puzzles_api}
/// A Flutter implementation of the PuzzlesApi that uses local storage.
/// {@endtemplate}
class LocalStoragePuzzlesApi extends PuzzlesApi {
  /// {@macro local_storage_puzzles_api}
  const LocalStoragePuzzlesApi({
    required PuzzlesDao puzzlesDao,
    required PuzzlesItemDao puzzlesItemDao,
  })  : _puzzlesDao = puzzlesDao,
        _puzzlesItemDao = puzzlesItemDao;

  final PuzzlesDao _puzzlesDao;
  final PuzzlesItemDao _puzzlesItemDao;

  /// Insert a puzzle
  @override
  Future<void> insertPuzzle(Puzzle puzzle) => _puzzlesDao.insertPuzzle(puzzle);

  /// Update a puzzle
  //
  @override
  Future<void> updatePuzzle(Puzzle puzzle) => _puzzlesDao.updatePuzzle(puzzle);

  /// Delete a puzzle
  //
  @override
  Future<void> deletePuzzle(Puzzle puzzle) => _puzzlesDao.deletePuzzle(puzzle);

  /// Get all puzzles
  Future<List<Puzzle>?>? getAllPuzzles() => _puzzlesDao.getAllPuzzles();

  /// stream  all puzzles
  //
  @override
  Stream<List<Puzzle>?>? streamAllPuzzles() => _puzzlesDao.streamAllPuzzles();

  /// Get a puzzle by id
  //
  @override
  Future<Puzzle?>? getPuzzleById(int id) => _puzzlesDao.getPuzzleById(id);

  ///======== PUZZLEITEMS=============
  ///
  //
  /// Insert a puzzleItem
  //
  @override
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.insertPuzzleItem(puzzleItem);

  /// Update a puzzleItem
  //
  @override
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.updatePuzzleItem(puzzleItem);

  /// Delete a puzzleItem given [puzzleItem]
  //
  @override
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.deletePuzzleItem(puzzleItem);

  /// Get all puzzleItem given puzzle [id]
  //
  @override
  Future<List<PuzzleItem>?>? getAllPuzzlesItems(int id) =>
      _puzzlesItemDao.getAllPuzzlesItems(id);

  /// stream  all puzzleItems given puzzle[id]
  //
  @override
  Stream<List<PuzzleItem>?>? streamAllPuzzlesItems(int id) =>
      _puzzlesItemDao.streamAllPuzzlesItems(id);

  /// Get a puzzleItem by id
  //
  @override
  Future<PuzzleItem?>? getPuzzleItemById(int id) =>
      _puzzlesItemDao.getPuzzleItemById(id);

  @override
  Future<void> savePuzzleItem(PuzzleItem puzzleItem) =>
      _puzzlesItemDao.insertPuzzleItem(puzzleItem);

  @override
  Stream<List<PuzzleItem>>? streamPuzzleItems(int puzzleId) =>
      _puzzlesItemDao.streamAllPuzzlesItems(puzzleId);
}
