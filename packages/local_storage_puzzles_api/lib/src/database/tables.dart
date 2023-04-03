import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/model_converters.dart';

// ignore: comment_references
/// [PuzzlesItemsModel] table
class PuzzlesItemsModelTable extends Table {
  /// drift id
  IntColumn get id => integer().autoIncrement()();

  /// [puzzleId] used for quick queries
  IntColumn get puzzleId => integer().nullable()();

  /// [puzzleType] used for quick queries
  TextColumn get puzzleType => text().nullable()();

  /// [puzzleItem] full puzzle item
  TextColumn get puzzleItem =>
      text().map(PuzzlesItemsModelConverter()).nullable()();
}

// ignore: comment_references
/// [PuzzlesModel] table
class PuzzlesModelTable extends Table {
  /// drift id
  IntColumn get id => integer().autoIncrement()();

  /// [puzzleType] used for quick queries
  TextColumn get puzzleType => text().nullable()();

  /// [puzzle] full puzzle
  TextColumn get puzzle => text().map(PuzzlesModelConverter()).nullable()();
}
