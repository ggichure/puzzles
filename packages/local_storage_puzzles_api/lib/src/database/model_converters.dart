import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:puzzles_api/puzzles_api.dart';

/// {@template puzzles_converter}
/// Convert [PuzzlesModel] to a drift obj
/// {@endtemplate}
class PuzzlesModelConverter extends TypeConverter<PuzzlesModel, String> {
  /// {@macro puzzles_converter}
  PuzzlesModel? mapToDart(String? fromDb) {
    return PuzzlesModel.fromJson(
      json.decode(fromDb!) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_converter}
  String? mapToSql(PuzzlesModel? value) {
    return json.encode(value?.toJson());
  }

  /// {@macro puzzles_converter}
  @override
  PuzzlesModel fromSql(String fromDb) {
    return PuzzlesModel.fromJson(
      json.decode(fromDb) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_converter}
  @override
  String toSql(PuzzlesModel value) {
    return json.encode(value.toJson());
  }
}

/// {@template puzzles_items_converter}
/// Convert [PuzzlesItemModel] to a drift obj
/// {@endtemplate}
class PuzzlesItemsModelConverter
    extends TypeConverter<PuzzlesItemModel, String> {
  /// {@macro puzzles_items_converter}
  PuzzlesItemModel? mapToDart(String? fromDb) {
    return PuzzlesItemModel.fromJson(
      json.decode(fromDb!) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_items_converter}
  String? mapToSql(PuzzlesItemModel? value) {
    return json.encode(value?.toJson());
  }

  /// {@macro puzzles_items_converter}
  @override
  PuzzlesItemModel fromSql(String fromDb) {
    return PuzzlesItemModel.fromJson(
      json.decode(fromDb) as Map<String, dynamic>,
    );
  }

  /// {@macro puzzles_items_converter}
  @override
  String toSql(PuzzlesItemModel value) {
    return json.encode(value.toJson());
  }
}
