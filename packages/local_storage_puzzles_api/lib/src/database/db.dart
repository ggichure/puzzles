import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzle_items_dao.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzles_dao.dart';
import 'package:local_storage_puzzles_api/src/database/tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

/// Init db connection
LazyDatabase openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'puzzles/db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  daos: [PuzzlesDao, PuzzlesItemDao],
  tables: [PuzzlesItemTable, PuzzlesTable],
)

/// Our App database
class MyDatabase extends _$MyDatabase {
  /// Our App database
  MyDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
