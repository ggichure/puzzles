import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';

/// {@template puzzles_dao}
///  API providing access to read write to puzzles local db methods include
/// [getPuzzles], [getPuzzlesItems], [savePuzzle], [savePuzzleItems],
/// [deletePuzzle] , [deletePuzzleItem], [deleteAllPuzzles]
/// {@endtemplate}
class PuzzlesDao extends MyDatabase {
  /// Provides a [Stream ] of all Puzzles
  Stream<List<PuzzlesModelTableData>>? getPuzzles() async* {
    yield* (select(puzzlesModelTable)).watch();
  }

  /// Provides a [Stream ] of all Puzzles Items given [puzzleId]
  Stream<List<PuzzlesItemsModelTableData>>? getPuzzlesItems(
    int puzzleId,
  ) async* {
    yield* (select(puzzlesItemsModelTable)
          ..where(
            (tbl) => puzzlesItemsModelTable.puzzleId.equals(
              puzzleId,
            ),
          ))
        .watch();
  }

  /// used to store puzzles to drift db [PuzzlesModelTableData]
  /// can also double down as your update function
  Future<void> savePuzzle(
    PuzzlesModelTableData? puzzlesModelTableData,
  ) async {
    await into(puzzlesModelTable).insertOnConflictUpdate(
      PuzzlesModelTableCompanion.insert(
        puzzle: Value(puzzlesModelTableData?.puzzle),
        puzzleType: Value(puzzlesModelTableData?.puzzleType),
      ),
    );
  }

  /// used to delete puzzle given [puzzleId]
  ///
  /// It also deletes puzzle items
  Future<void> deletePuzzle(
    int puzzleId,
  ) async {
    return transaction(() async {
      // ignore: await_only_futures, avoid_single_cascade_in_expression_statements
      await delete(puzzlesModelTable)
        ..where(
          (tbl) => puzzlesModelTable.id.equals(
            puzzleId,
          ),
        );
      // ignore: await_only_futures, avoid_single_cascade_in_expression_statements
      await delete(puzzlesItemsModelTable)
        ..where(
          (tbl) => puzzlesItemsModelTable.puzzleId.equals(
            puzzleId,
          ),
        );
    });
  }

  /// used to clear entire database
  Future<void> deleteAllPuzzles() async {
    return transaction(() async {
      // ignore: await_only_futures, avoid_single_cascade_in_expression_statements
      await delete(puzzlesModelTable);
      // ignore: await_only_futures, avoid_single_cascade_in_expression_statements
      await delete(puzzlesItemsModelTable);
    });
  }

  /// Delete puzzle item which matches id [puzzleItemId]
  Future<void> deletePuzzleItem(
    int puzzleItemId,
  ) async {
    delete(puzzlesItemsModelTable).where(
      (tbl) => puzzlesItemsModelTable.id.equals(
        puzzleItemId,
      ),
    );
  }

  /// used to save puzzle items to loacl db [PuzzlesItemsModelTableData]
  Future<void> savePuzzleItems(
    PuzzlesItemsModelTableData? puzzlesItemsModelTableData,
  ) async {
    await into(puzzlesItemsModelTable).insertOnConflictUpdate(
      PuzzlesItemsModelTableCompanion.insert(
        puzzleItem: Value(puzzlesItemsModelTableData?.puzzleItem),
        puzzleId: Value(puzzlesItemsModelTableData?.puzzleId),
        puzzleType: Value(puzzlesItemsModelTableData?.puzzleType),
      ),
    );
  }
}
