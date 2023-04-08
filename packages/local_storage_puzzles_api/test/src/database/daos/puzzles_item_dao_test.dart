import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzle_items_dao.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:mockito/mockito.dart';
import 'package:puzzles_api/puzzles_api.dart';

class MockPuzzlesItemDao extends Mock implements PuzzlesItemDao {
  @override
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) => Future.value();

  @override
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) => Future.value();

  @override
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) => Future.value();

  @override
  Future<List<PuzzleItem>>? getAllPuzzlesItems(int id) =>
      Future.value(puzzleItems);

  @override
  Stream<List<PuzzleItem>> streamAllPuzzlesItems(int id) =>
      Stream.value(puzzleItems);

  @override
  Future<PuzzleItem?>? getPuzzleItemById(int id) => Future.value(puzzleItem);
}

final puzzleItems = [puzzleItem];
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

  late MyDatabase mockDatabase;
  late PuzzlesItemDao puzzlesItemDao;
  group('PuzzlesItemDao tests', () {
    setUp(() {
      final inMemory = DatabaseConnection(NativeDatabase.memory());
      // Initialize the database with the temporary file
      mockDatabase = MyDatabase(inMemory);

      puzzlesItemDao = PuzzlesItemDao(mockDatabase);
    });
    // Close the database after each test
    tearDown(() async {
      await mockDatabase.close();
    });
    test('Test insertPuzzleItem', () async {
      await puzzlesItemDao.insertPuzzleItem(puzzleItem);
      // ignore: inference_failure_on_instance_creation

      // Verify that the insertPuzzleItem method is called with the correct
      // argument
      final result = await puzzlesItemDao.getPuzzleItemById(1);

      expect(puzzleItem, equals(result));
    });

    test('Test updatePuzzleItem', () async {
      await puzzlesItemDao.insertPuzzleItem(puzzleItem);
      await puzzlesItemDao
          .updatePuzzleItem(puzzleItem.copyWith(createdAt: '12'));

      // Verify that the updatePuzzleItem method is called with the correct
      // argument
      final result = await puzzlesItemDao.getPuzzleItemById(1);

      expect(puzzleItem.copyWith(createdAt: '12'), equals(result));
    });

    test('Test deletePuzzleItem', () async {
      await puzzlesItemDao.insertPuzzleItem(puzzleItem);
      await puzzlesItemDao.deletePuzzleItem(puzzleItem);

      // Verify that the updatePuzzleItem method is called with the correct
      // argument
      final result = await puzzlesItemDao.getPuzzleItemById(1);

      expect(result, null);
    });

    test('Test getAllPuzzlesItems', () async {
      const id = 1;

      await puzzlesItemDao.insertPuzzleItem(puzzleItem);

      final result = await puzzlesItemDao.getAllPuzzlesItems(id);

      // Verify that the result matches the expected puzzleItems
      expect(result, puzzleItems);
    });

    test('Test streamAllPuzzlesItems', () async {
      const id = 1;

      await puzzlesItemDao.insertPuzzleItem(puzzleItem);

      final result = puzzlesItemDao.streamAllPuzzlesItems(id);

      // Verify that the streamAllPuzzlesItems method is called with the correct
      // argument

      // Verify that the result matches the expected puzzleItems
      expect(result, emits(puzzleItems));
    });
  });
}
