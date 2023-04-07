// Puzzles Table
// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/model_converters.dart';

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
  TextColumn get choices =>
      text().map(const ListStringConverter()).nullable()();
  IntColumn get puzzleId => integer().nullable()();
}
