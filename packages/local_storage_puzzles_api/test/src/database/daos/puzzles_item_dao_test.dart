import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzle_items_dao.dart';
import 'package:mockito/mockito.dart';
import 'package:drift/drift.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/tables.dart';
import 'package:puzzles_api/puzzles_api.dart';

class MockMyDatabase extends Mock implements MyDatabase {
  final QueryExecutor queryExecutor;

  MockMyDatabase(this.queryExecutor);

  // @override
  // PuzzlesItemTable get puzzlesItemTable => MockPuzzlesItemTable();

  @override
  Future<void> close() async {}

  // Implement any other methods or properties of MyDatabase that you need to mock
}

class MockPuzzlesItemDao extends Mock implements PuzzlesItemDao {
  @override
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) => Future.value();

  @override
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) => Future.value();

  @override
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) => Future.value();

  @override
  Future<List<PuzzleItem>>? getAllPuzzlesItems(int id) => Future.value([]);

  @override
  Stream<List<PuzzleItem>> streamAllPuzzlesItems(int id) => Stream.value([]);

  @override
  Future<PuzzleItem?>? getPuzzleItemById(int id) => Future.value();
}

final puzzleItem = PuzzleItem(
  id: 1,
  puzzleId: 1,
  puzzleType: 'xoxo',
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  choices: const ['Item 1', 'item 2'],
);
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   late MockMyDatabase mockDatabase;
//   late PuzzlesItemDao puzzlesItemDao;
//   group('PuzzlesItemDao tests', () {
//     setUp(() {
//       final inMemory = DatabaseConnection(NativeDatabase.memory());
//       // Initialize the database with the temporary file
//       mockDatabase = MockMyDatabase(inMemory);

//       puzzlesItemDao = PuzzlesItemDao(mockDatabase);
//     });

//     test('Test insertPuzzleItem', () async {
//       await puzzlesItemDao.insertPuzzleItem(puzzleItem);

//       // Verify that the insertPuzzleItem method is called with the correct argument
//       verify(
//         mockDatabase.puzzlesItemTable.insertOnConflictUpdate(
//           PuzzlesItemTableData.fromJson(puzzleItem.toJson()),
//         ),
//       ).called(1);
//     });

//     test('Test updatePuzzleItem', () async {
//       await puzzlesItemDao.updatePuzzleItem(puzzleItem);

//       // Verify that the updatePuzzleItem method is called with the correct argument
//       verify(mockDatabase.puzzlesItemTable
//               .replaceOne(PuzzlesItemTableData.fromJson(puzzleItem.toJson())))
//           .called(1);
//     });

//     test('Test deletePuzzleItem', () async {
//       await puzzlesItemDao.deletePuzzleItem(puzzleItem);

//       // Verify that the deletePuzzleItem method is called with the correct
//       // argument
//       verify(
//         mockDatabase.puzzlesItemTable
//             .delete()
//             .delete(PuzzlesItemTableData.fromJson(puzzleItem.toJson())),
//       ).called(1);
//     });

//     test('Test getAllPuzzlesItems', () async {
//       final id = 1;
//       final puzzleItems = [puzzleItem];
//       when(puzzlesItemDao.getAllPuzzlesItems(id))
//           .thenAnswer((_) => Future.value(puzzleItems));

//       final result = await puzzlesItemDao.getAllPuzzlesItems(id);

//       // Verify that the getAllPuzzlesItems method is called with the correct argument
//       verify(mockDatabase.puzzlesItemTable.select().get()).called(1);

//       // Verify that the result matches the expected puzzleItems
//       expect(result, puzzleItems);
//     });

//     test('Test streamAllPuzzlesItems', () async {
//       const id = 1;
//       final puzzleItems = [puzzleItem];
//       when(puzzlesItemDao.streamAllPuzzlesItems(id))
//           .thenAnswer((_) => Stream.value(puzzleItems));

//       final result = puzzlesItemDao.streamAllPuzzlesItems(id);

//       // Verify that the streamAllPuzzlesItems method is called with the correct argument
//       verify(mockDatabase.puzzlesItemTable.select().watch()).called(1);

//       // Verify that the result matches the expected puzzleItems
//       expect(await result.first, puzzleItems);
//     });
//   });
// }
