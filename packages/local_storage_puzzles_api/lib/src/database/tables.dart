// Puzzles Table
// ignore_for_file: public_member_api_docs

import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/model_converters.dart';

/// {@macro puzzle}
class PuzzlesTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  @JsonKey('created_at')
  TextColumn get createdAt => text().nullable()();
  @JsonKey('completed_at')
  TextColumn get completedAt => text().nullable()();
  @JsonKey('puzzle_type')
  TextColumn get puzzleType => text().nullable()();
}

// PuzzlesItem Table
/// {@macro puzzle_item}
class PuzzlesItemTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  @JsonKey('created_at')
  TextColumn get createdAt => text().nullable()();
  @JsonKey('completed_at')
  TextColumn get completedAt => text().nullable()();
  @JsonKey('puzzle_type')
  TextColumn get puzzleType => text().nullable()();
  TextColumn get choices =>
      text().map(const ListStringConverter()).nullable()();
  @JsonKey('puzzle_id')
  IntColumn get puzzleId => integer().nullable()();
}
