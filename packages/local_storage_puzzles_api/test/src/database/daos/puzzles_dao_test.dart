import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/src/database/daos/puzzles_dao.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:mockito/mockito.dart';
import 'package:puzzles_api/puzzles_api.dart';

class MockPuzzlesDao extends Mock implements PuzzlesDao {
  @override
  Future<Puzzle> insertPuzzle(Puzzle puzzle) => Future.value(puzzle);

  @override
  Future<void> updatePuzzle(Puzzle puzzle) => Future.value();

  @override
  Future<void> deletePuzzle(Puzzle puzzle) => Future.value();

  @override
  Future<List<Puzzle>>? getAllPuzzles() => Future.value(puzzles);

  @override
  Stream<List<Puzzle>> streamAllPuzzles(String? puzzleType) =>
      Stream.value(puzzles);

  @override
  Future<Puzzle?>? getPuzzleById(int id) => Future.value(puzzle);
}

final puzzles = [puzzle];
final puzzle = Puzzle(
  id: 1,
  puzzleType: 'xoxo',
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
);
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MyDatabase mockDatabase;
  late PuzzlesDao puzzlesDao;
  group('PuzzlesDao tests', () {
    setUp(() {
      final inMemory = DatabaseConnection(NativeDatabase.memory());
      // Initialize the database with the temporary file
      mockDatabase = MyDatabase(inMemory);

      puzzlesDao = PuzzlesDao(mockDatabase);
    });
    // Close the database after each test
    tearDown(() async {
      await mockDatabase.close();
    });
    test('Test insertPuzzle', () async {
      await puzzlesDao.insertPuzzle(puzzle);
      // ignore: inference_failure_on_instance_creation

      // Verify that the insertPuzzle method is called with the correct
      // argument
      final result = await puzzlesDao.getPuzzleById(1);

      expect(puzzle, equals(result));
    });

    test('Test updatePuzzle', () async {
      await puzzlesDao.insertPuzzle(puzzle);
      await puzzlesDao.updatePuzzle(puzzle.copyWith(createdAt: '12'));

      // Verify that the updatePuzzle method is called with the correct
      // argument
      final result = await puzzlesDao.getPuzzleById(1);

      expect(puzzle.copyWith(createdAt: '12'), equals(result));
    });

    test('Test deletePuzzle', () async {
      await puzzlesDao.insertPuzzle(puzzle);
      await puzzlesDao.deletePuzzle(puzzle);
      // ignore: flutter_style_todos
      // ignore: todo
      // TODO(assert): assert on delete
    });

    test('Test getAllPuzzles', () async {
      await puzzlesDao.insertPuzzle(puzzle);

      final result = await puzzlesDao.getAllPuzzles();

      // Verify that the result matches the expected puzzles
      expect(result, puzzles);
    });

    test('Test streamAllPuzzles', () async {
      await puzzlesDao.insertPuzzle(puzzle);

      final result = puzzlesDao.streamAllPuzzles('puzzleType');

      // Verify that the streamAllPuzzles method is called with the correct
      // argument

      // Verify that the result matches the expected puzzles
      expect(result, emits(puzzles));
    });
  });
}
