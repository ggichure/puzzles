// Puzzles Table
import 'package:drift/drift.dart';

/// {@macro puzzle}
class PuzzlesTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get completedAt => text().nullable()();
  TextColumn get puzzleType => text().nullable()();
}

// PuzzlesItem Table
/// {@macro puzzle_item}
class PuzzlesItemTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get completedAt => text().nullable()();
  TextColumn get puzzleType => text().nullable()();
  TextColumn get choices => text().nullable()();
  IntColumn get puzzleId => integer().nullable()();
}
