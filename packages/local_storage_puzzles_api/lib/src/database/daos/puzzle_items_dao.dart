import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/tables.dart';
import 'package:puzzles_api/puzzles_api.dart';

part 'puzzle_items_dao.g.dart';

@DriftAccessor(tables: [PuzzlesItemTable])

/// {@macro puzzles_api}
class PuzzlesItemDao extends DatabaseAccessor<MyDatabase>
    with _$PuzzlesItemDaoMixin {
  /// {@macro puzzles_api}
  PuzzlesItemDao(super.db);

  /// Insert a PuzzleItem object
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) =>
      into(puzzlesItemTable).insertOnConflictUpdate(
        PuzzlesItemTableData.fromJson(puzzleItem.toJson()),
      );

  /// Update a PuzzleItem object
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) =>
      update(puzzlesItemTable)
          .replace(PuzzlesItemTableData.fromJson(puzzleItem.toJson()));

  /// Delete a PuzzleItem object given [puzzleItem]
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) =>
      delete(puzzlesItemTable)
          .delete(PuzzlesItemTableData.fromJson(puzzleItem.toJson()));

  /// Get all PuzzleItem objects given puzzle [id]
  Future<List<PuzzleItem>>? getAllPuzzlesItems(int id) async {
    final puzzleItems = await select(puzzlesItemTable).get();
    return puzzleItems
        .map((puzzleItem) => PuzzleItem.fromJson(puzzleItem.toJson()))
        .toList();
  }

  /// Provide a [Stream] of all PuzzleItems given puzzle [id]
  Stream<List<PuzzleItem>> streamAllPuzzlesItems(int id) {
    return select(puzzlesItemTable).watch().map((puzzleItems) {
      return puzzleItems
          .map((puzzleItem) => PuzzleItem.fromJson(puzzleItem.toJson()))
          .toList();
    });
  }

  /// Get a PuzzleItem object by id
  Future<PuzzleItem?>? getPuzzleItemById(int id) async {
    final puzzleItem = await (select(puzzlesItemTable)
          ..where((p) => p.id.equals(id)))
        .getSingleOrNull();
    return puzzleItem != null ? PuzzleItem.fromJson(puzzleItem.toJson()) : null;
  }
}
