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

  @JsonKey('puzzle_id')
  IntColumn get puzzleId => integer().nullable()();

  @JsonKey('duration_in_seconds')
  IntColumn get durationInSeconds => integer().nullable()();

  @JsonKey('length_of_characters')
  IntColumn get lengthOfCharacters => integer().nullable()();

  @JsonKey('no_of_puzzle_items')
  IntColumn get noOfPuzzleItems => integer().nullable()();

  @JsonKey('completed_puzzles')
  IntColumn get completedPuzzles => integer().nullable()();

  @JsonKey('difficulty_level')
  RealColumn get difficultyLevel => real().nullable()();
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

  @JsonKey('is_correct')
  BoolColumn get isCorrect => boolean().nullable()();

  @JsonKey('is_similar')
  BoolColumn get isSimilar => boolean().nullable()();
}
