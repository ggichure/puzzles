import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:puzzles_api/puzzles_api.dart';

final puzzle = Puzzle(
  id: 1,
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  puzzleType: 'xoxo',
);

final puzzleItem = PuzzleItem(
  id: 1,
  puzzleId: 1,
  puzzleType: 'xoxo',
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  choices: const ['Item 1', 'item 2'],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MyDatabase database;

  // Set up the database before each test
  setUp(() async {
    final inMemory = DatabaseConnection(NativeDatabase.memory());
    // Initialize the database with the temporary file
    database = MyDatabase(inMemory);
  });

  // Close the database after each test
  tearDown(() async {
    await database.close();
  });
  // Test inserting a Puzzle into the database
  // Test database connection and initialization
  test('Test Database Connection and Initialization', () async {
    // Check if the database is connected
    final entry = await database.puzzlesTable
        .insertReturning(PuzzlesTableData.fromJson(puzzle.toJson()));
    final result = await (database.puzzlesTable.select()
          ..where((tbl) => tbl.id.equals(1)))
        .getSingle();
    expect(result, equals(entry));
  });
}
