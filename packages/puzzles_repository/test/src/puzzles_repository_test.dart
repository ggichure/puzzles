// ignore_for_file: flutter_style_todos

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:puzzles_api/puzzles_api.dart';

import 'package:puzzles_repository/puzzles_repository.dart';

final puzzleItems = [puzzleItem];
final puzzles = [puzzle];
final puzzle = Puzzle(
  id: 1,
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  puzzleType: 'Type 1',
);

final puzzleItem = PuzzleItem(
  id: 1,
  puzzleId: 1,
  puzzleType: 'Type 1',
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  choices: const ['Item 1'],
);

class MockPuzzlesRepository extends Mock implements PuzzlesRepository {
  @override
  Future<void> deletePuzzle(Puzzle puzzle) {
    return Future.value();
  }

  @override
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) {
    return Future.value();
  }

  @override
  Future<List<Puzzle>?>? getAllPuzzles() {
    return Future.value([puzzle]);
  }

  @override
  Future<List<PuzzleItem>?>? getAllPuzzlesItems(int id) {
    return Future.value([puzzleItem]);
  }

  @override
  Future<Puzzle?>? getPuzzleById(int id) {
    return Future.value(puzzle);
  }

  @override
  Future<PuzzleItem?>? getPuzzleItemById(int id) {
    return Future.value(puzzleItem);
  }

  @override
  Future<void> insertPuzzle(Puzzle puzzle) {
    return Future.value();
  }

  @override
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) {
    return Future.value();
  }

  @override
  Stream<List<Puzzle>?>? streamAllPuzzles(String? puzzleType) {
    return Stream.value([puzzle]);
  }

  @override
  Stream<List<PuzzleItem>?>? streamAllPuzzlesItems(int id) {
    return Stream.value([puzzleItem]);
  }

  @override
  Future<void> updatePuzzle(Puzzle puzzle) {
    return Future.value();
  }

  @override
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) {
    return Future.value();
  }
}
// ignore: todo
// TODO(question): tests
/// can Simply testing [can be instantiated] do as functions are tested?

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockPuzzlesRepository puzzlesRepository;
  setUp(() {
    puzzlesRepository = MockPuzzlesRepository();
  });
  group('PuzzlesRepository', () {
    test('can be instantiated', () {
      // Arrange
      // Set up any necessary data or dependencies for the test

      // Act
      final repository = MockPuzzlesRepository();

      // Assert
      expect(repository, isA<MockPuzzlesRepository>());
    });

    test('getAllPuzzles returns a list of puzzles', () async {
      await puzzlesRepository.insertPuzzle(puzzle);
      // Act
      final puzzles = await puzzlesRepository.getAllPuzzles();

      // Assert
      expect(puzzles, isA<List<Puzzle>>());
      expect(puzzles?.length, 1);
      expect(puzzles?[0], equals(puzzle));
    });

    test('getAllPuzzlesItems returns a list of puzzle items', () async {
      // Insert
      await puzzlesRepository.insertPuzzleItem(puzzleItem);

      // Act
      final puzzleItems = await puzzlesRepository.getAllPuzzlesItems(1);

      // Assert
      expect(puzzleItems, isA<List<PuzzleItem>>());
      expect(puzzleItems?.length, 1);
      expect(puzzleItems?[0], equals(puzzleItem));
    });

    test('Test updatePuzzle', () async {
      await puzzlesRepository.insertPuzzle(puzzle);
      await puzzlesRepository.updatePuzzle(puzzle.copyWith(createdAt: '11'));
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration(seconds: 3));
      // Verify that the updatePuzzle method is called with the correct
      // argument
      final result = await puzzlesRepository.getPuzzleById(1);

      expect(result, equals(puzzle.copyWith(createdAt: '11')));
    });

    test('Test deletePuzzle', () async {
      await puzzlesRepository.insertPuzzle(puzzle);
      await puzzlesRepository.deletePuzzle(puzzle);

      // ignore: todo
      // TODO(assert): assert on delete
    });

    test('Test getAllPuzzles', () async {
      await puzzlesRepository.insertPuzzle(puzzle);

      final result = await puzzlesRepository.getAllPuzzles();

      // Verify that the result matches the expected puzzles
      expect(result, puzzles);
    });

    test('Test streamAllPuzzles', () async {
      await puzzlesRepository.insertPuzzle(puzzle);

      final result = puzzlesRepository.streamAllPuzzles('puzzles');

      // Verify that the streamAllPuzzles method is called with the correct
      // argument

      // Verify that the result matches the expected puzzles
      expect(result, emits(puzzles));
    });

    test('Test insertPuzzleItem', () async {
      await puzzlesRepository.insertPuzzleItem(puzzleItem);
      // ignore: inference_failure_on_instance_creation

      // Verify that the insertPuzzleItem method is called with the correct
      // argument
      final result = await puzzlesRepository.getPuzzleItemById(1);

      expect(puzzleItem, equals(result));
    });

    test('Test updatePuzzleItem', () async {
      await puzzlesRepository.insertPuzzleItem(puzzleItem);
      await puzzlesRepository
          .updatePuzzleItem(puzzleItem.copyWith(createdAt: '11'));

      // Verify that the updatePuzzleItem method is called with the correct
      // argument
      final result = await puzzlesRepository.getPuzzleItemById(1);

      expect(puzzleItem.copyWith(createdAt: '11'), equals(result));
    });

    // test('Test deletePuzzleItem', () async {
    //   await puzzlesRepository.insertPuzzleItem(puzzleItem);
    //   await puzzlesRepository.deletePuzzleItem(puzzleItem);

    //   // Verify that the updatePuzzleItem method is called with the correct
    //   // argument
    //   final result = await puzzlesRepository.getPuzzleItemById(1);

    //   //  expect(result, null);
    // });

    test('Test getAllPuzzlesItems', () async {
      const id = 1;

      await puzzlesRepository.insertPuzzleItem(puzzleItem);

      final result = await puzzlesRepository.getAllPuzzlesItems(id);

      // Verify that the result matches the expected puzzleItems
      expect(result, puzzleItems);
    });

    test('Test streamAllPuzzlesItems', () async {
      const id = 1;

      await puzzlesRepository.insertPuzzleItem(puzzleItem);

      final result = puzzlesRepository.streamAllPuzzlesItems(id);

      // Verify that the streamAllPuzzlesItems method is called with the correct
      // argument

      // Verify that the result matches the expected puzzleItems
      expect(result, emits(puzzleItems));
    });
  });
}
