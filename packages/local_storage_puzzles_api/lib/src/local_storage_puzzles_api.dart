import 'package:get_it/get_it.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/puzzles_dao.dart';

/// initialize the db locator
GetIt dbLocator = GetIt.instance;

/// initialize the db locator
Future<void> setupDBLocator() async {
  dbLocator
    ..registerSingleton(openConnection())
    ..registerSingleton(PuzzlesDao());
}

/// {@template local_storage_puzzles_api}
/// A Flutter implementation of the Puzzles  that uses local storage.
/// {@endtemplate}
///
/// {@macro puzzles_dao}
class LocalStoragePuzzlesApi {
  /// {@template puzzles_dao}
  LocalStoragePuzzlesApi() {
    setupDBLocator();
  }

  /// {@macro puzzles_getPuzzles}
  Stream<List<PuzzlesModelTableData>> getPuzzles() async* {
    yield* dbLocator<PuzzlesDao>().getPuzzles();
  }

  /// {@macro puzzles_getPuzzleById}
  Future<PuzzlesModelTableData?> getPuzzleById(int id) async {
    return dbLocator<PuzzlesDao>().getPuzzleById(id);
  }

  /// {@macro puzzles_getPuzzleItemById}
  Future<PuzzlesItemsModelTableData?> getPuzzleItemById(int id) async {
    return dbLocator<PuzzlesDao>().getPuzzleItemById(id);
  }

  /// {@macro puzzles_getPuzzlesItems}
  Stream<List<PuzzlesItemsModelTableData>> getPuzzlesItems(
    int puzzleId,
  ) async* {
    yield* dbLocator<PuzzlesDao>().getPuzzlesItems(puzzleId);
  }

  /// {@macro puzzles_savePuzzle}
  Future<void> savePuzzle(
    PuzzlesModelTableData? puzzlesModelTableData,
  ) async {
    return dbLocator<PuzzlesDao>().savePuzzle(puzzlesModelTableData);
  }

  /// {@macro puzzles_savePuzzleItems}
  Future<void> savePuzzleItems(
    PuzzlesItemsModelTableData? puzzlesItemsModelTableData,
  ) async {
    return dbLocator<PuzzlesDao>().savePuzzleItems(puzzlesItemsModelTableData);
  }

  /// {@macro puzzles_deletePuzzleItems}
  Future<void> deletePuzzleItem(
    int puzzleItemId,
  ) async {
    return dbLocator<PuzzlesDao>().deletePuzzleItem(puzzleItemId);
  }

  /// {@macro puzzles_deleteAllPuzzles}
  Future<void> deleteAllPuzzles() async {
    return dbLocator<PuzzlesDao>().deleteAllPuzzles();
  }

  /// {@macro puzzles_deletePuzzle}
  Future<void> deletePuzzle(
    int puzzleId,
  ) async {
    return dbLocator<PuzzlesDao>().deletePuzzle(puzzleId);
  }
}
