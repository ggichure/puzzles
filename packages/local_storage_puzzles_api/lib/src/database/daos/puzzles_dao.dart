import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/tables.dart';
import 'package:puzzles_api/puzzles_api.dart';

part 'puzzles_dao.g.dart';

@DriftAccessor(tables: [PuzzlesTable])

/// {@macro puzzles_api}
class PuzzlesDao extends DatabaseAccessor<MyDatabase> with _$PuzzlesDaoMixin {
  /// {@macro puzzles_api}
  PuzzlesDao(super.attachedDatabase);

  /// Insert a PuzzlesModel object
  /// returns a puzzle item with inserted id
  Future<Puzzle>? insertPuzzle(Puzzle puzzle) async {
    final insertedItemId = await into(puzzlesTable).insertOnConflictUpdate(
      PuzzlesTableData.fromJson(
        puzzle.copyWith(createdAt: DateTime.now().toIso8601String()).toJson(),
      ),
    );
    return puzzle.copyWith(id: insertedItemId);
  }

  /// Update a Puzzle object
  Future<void> updatePuzzle(Puzzle puzzle) =>
      update(puzzlesTable).replace(PuzzlesTableData.fromJson(puzzle.toJson()));

  /// Delete a Puzzle object
  Future<void> deletePuzzle(Puzzle puzzle) =>
      delete(puzzlesTable).delete(PuzzlesTableData.fromJson(puzzle.toJson()));

  /// Get all Puzzle objects
  Future<List<Puzzle>>? getAllPuzzles() async {
    final puzzles = await select(puzzlesTable).get();
    return puzzles.map((puzzle) => Puzzle.fromJson(puzzle.toJson())).toList();
  }

  /// Provide a [Stream] of all puzzles
  Stream<List<Puzzle>> streamAllPuzzles(String? puzzleType) {
    if (puzzleType?.isEmpty ?? false) {
      return (select(puzzlesTable)
            ..orderBy([
              (u) =>
                  OrderingTerm(expression: u.createdAt, mode: OrderingMode.desc)
            ]))
          .watch()
          .map((puzzles) {
        return puzzles
            .map((puzzle) => Puzzle.fromJson(puzzle.toJson()))
            .toList();
      });
    } else {
      return (select(puzzlesTable)
            ..where((tbl) => tbl.puzzleType.equals(puzzleType!))
            ..orderBy([
              (u) =>
                  OrderingTerm(expression: u.createdAt, mode: OrderingMode.desc)
            ]))
          .watch()
          .map((puzzles) {
        return puzzles
            .map((puzzle) => Puzzle.fromJson(puzzle.toJson()))
            .toList();
      });
    }
  }

  /// Get a Puzzle object by id
  Future<Puzzle?>? getPuzzleById(int id) async {
    final puzzle =
        await (select(puzzlesTable)..where((p) => p.id.equals(id))).getSingle();
    return Puzzle.fromJson(puzzle.toJson());
  }
}
