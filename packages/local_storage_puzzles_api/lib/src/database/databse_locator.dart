import 'package:get_it/get_it.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/puzzles_dao.dart';

// ignore: public_member_api_docs
GetIt dbLocator = GetIt.instance;
Future<void> setupDBLocator() async {
  dbLocator
    ..registerSingleton(openConnection())
    ..registerSingleton(PuzzlesDao());
}

/// {@macro puzzles_getPuzzles}
Stream<List<PuzzlesModelTableData>> getPuzzles() async* {
  yield* dbLocator<PuzzlesDao>().getPuzzles();
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
Future<void> deleteAllPuzzles(
  int puzzleItemId,
) async {
  return dbLocator<PuzzlesDao>().deleteAllPuzzles();
}

/// {@macro puzzles_deletePuzzle}
Future<void> deletePuzzle(
  int puzzleId,
) async {
  return dbLocator<PuzzlesDao>().deletePuzzle(puzzleId);
}
