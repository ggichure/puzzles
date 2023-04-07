import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/tables.dart';
import 'package:puzzles_api/puzzles_api.dart';

part 'puzzles_dao.g.dart';

@DriftAccessor(tables: [PuzzlesTable])

/// {@macro puzzles_api}
class PuzzlesDao extends DatabaseAccessor<MyDatabase> with _$PuzzlesDaoMixin {
  /// {@macro puzzles_api}
  PuzzlesDao(super.db);

  /// Insert a PuzzlesModel object
  Future<int> insertPuzzle(Puzzle puzzle) => into(puzzlesTable)
      .insertOnConflictUpdate(PuzzlesTableData.fromJson(puzzle.toJson()));

  /// Update a Puzzle object
  Future<void> updatePuzzle(Puzzle puzzle) =>
      update(puzzlesTable).replace(PuzzlesTableData.fromJson(puzzle.toJson()));

  /// Delete a Puzzle object
  Future<int> deletePuzzle(Puzzle puzzle) =>
      delete(puzzlesTable).delete(PuzzlesTableData.fromJson(puzzle.toJson()));

  /// Get all Puzzle objects
  Future<List<Puzzle>>? getAllPuzzles() async {
    final puzzles = await select(puzzlesTable).get();
    return puzzles.map((puzzle) => Puzzle.fromJson(puzzle.toJson())).toList();
  }

  /// Provide a [Stream] of all puzzles
  Stream<List<Puzzle>> streamAllPuzzles() {
    return select(puzzlesTable).watch().map((puzzles) {
      return puzzles.map((puzzle) => Puzzle.fromJson(puzzle.toJson())).toList();
    });
  }

  /// Get a Puzzle object by id
  Future<Puzzle?>? getPuzzleById(int id) async {
    final puzzle =
        await (select(puzzlesTable)..where((p) => p.id.equals(id))).getSingle();
    return Puzzle.fromJson(puzzle.toJson());
  }
}
