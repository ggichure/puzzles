import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/puzzles_dao.dart';

/// {@template local_storage_puzzles_api}
/// A Flutter implementation of the Puzzles  that uses local storage.
/// {@endtemplate}
///
/// {@macro puzzles_dao}
class LocalStoragePuzzlesApi {
  /// {@macro local_storage_puzzles_api}
  const LocalStoragePuzzlesApi({
    required PuzzlesDao puzzlesDao,
  }) : _puzzlesDao = puzzlesDao;
  final PuzzlesDao _puzzlesDao;

  /// {@macro puzzles_getPuzzles}
  Stream<List<PuzzlesModelTableData>> getPuzzles() async* {
    yield* _puzzlesDao.getPuzzles();
  }

  /// {@macro puzzles_savePuzzle}
  Future<void> savePuzzle(
    PuzzlesModelTableData? puzzlesModelTableData,
  ) async {
    return _puzzlesDao.savePuzzle(puzzlesModelTableData);
  }

  /// {@macro puzzles_savePuzzleItems}
  Future<void> savePuzzleItems(
    PuzzlesItemsModelTableData? puzzlesItemsModelTableData,
  ) async {
    return _puzzlesDao.savePuzzleItems(puzzlesItemsModelTableData);
  }

  /// {@macro puzzles_deletePuzzleItems}
  Future<void> deletePuzzleItem(
    int puzzleItemId,
  ) async {
    return _puzzlesDao.deletePuzzleItem(puzzleItemId);
  }

  /// {@macro puzzles_deleteAllPuzzles}
  Future<void> deleteAllPuzzles() async {
    return _puzzlesDao.deleteAllPuzzles();
  }

  /// {@macro puzzles_deletePuzzle}
  Future<void> deletePuzzle(
    int puzzleId,
  ) async {
    return _puzzlesDao.deletePuzzle(puzzleId);
  }

  /// {@macro puzzles_getPuzzlesItems}
  Stream<List<PuzzlesItemsModelTableData>> getPuzzlesItems(
    int puzzleId,
  ) async* {
    yield* _puzzlesDao.getPuzzlesItems(puzzleId);
  }
}
