import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:puzzles_api/puzzles_api.dart';

/// {@template puzzles_converter}
/// Convert [Puzzle] to a drift obj
/// {@endtemplate}
class PuzzleConverter extends TypeConverter<Puzzle, String> {
  /// {@macro puzzles_converter}
  Puzzle? mapToDart(String? fromDb) {
    return Puzzle.fromJson(
      json.decode(fromDb!) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_converter}
  String? mapToSql(Puzzle? value) {
    return json.encode(value?.toJson());
  }

  /// {@macro puzzles_converter}
  @override
  Puzzle fromSql(String fromDb) {
    return Puzzle.fromJson(
      json.decode(fromDb) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_converter}
  @override
  String toSql(Puzzle value) {
    return json.encode(value.toJson());
  }
}

/// {@template puzzles_items_converter}
/// Convert [PuzzleItem] to a drift obj
/// {@endtemplate}
class PuzzlesItemsModelConverter extends TypeConverter<PuzzleItem, String> {
  /// {@macro puzzles_items_converter}
  PuzzleItem? mapToDart(String? fromDb) {
    return PuzzleItem.fromJson(
      json.decode(fromDb!) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_items_converter}
  String? mapToSql(PuzzleItem? value) {
    return json.encode(value?.toJson());
  }

  /// {@macro puzzles_items_converter}
  @override
  PuzzleItem fromSql(String fromDb) {
    return PuzzleItem.fromJson(
      json.decode(fromDb) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_items_converter}
  @override
  String toSql(PuzzleItem value) {
    return json.encode(value.toJson());
  }
}
