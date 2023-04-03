// ignore_for_file: public_member_api_docs, override_on_non_overriding_member

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:local_storage_puzzles_api/src/database/model_converters.dart';
import 'package:local_storage_puzzles_api/src/database/tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:puzzles_api/puzzles_api.dart';

part 'db.g.dart';

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

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(
  tables: <Type>[
    PuzzlesItemsModelTable,
    PuzzlesModelTable,
  ],
)

/// used to open a db connection
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(openConnection());

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (OpeningDetails details) async {},
    );
  }

  /// you should bump this number whenever you change or add a table definition.
  ///  Migrations
  /// are covered later in this readme.
  /// [schemaVersion] schemaVersion
  @override
  int get schemaVersion => 1;
}
