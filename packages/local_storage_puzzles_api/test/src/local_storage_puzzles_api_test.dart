// ignore_for_file: prefer_const_constructors

import 'package:drift/drift.dart' as dr;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/local_storage_puzzles_api.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:mockito/mockito.dart';
import 'package:puzzles_api/puzzles_api.dart';

class MockLocalStoragePuzzlesApi extends Mock
    implements LocalStoragePuzzlesApi {
  @override
  Future<void> deletePuzzle(Puzzle puzzle) async {
    return Future.value();
  }

  @override
  Future<void> deletePuzzleItem(PuzzleItem puzzleItem) {
    // Delete the puzzle item from a mock local storage
    return Future.value();
  }

  @override
  Future<List<Puzzle>?>? getAllPuzzles() {
    // Fetch all puzzles from a mock local storage and return as a List<Puzzle>
    return Future.value([puzzle]);
  }

  @override
  Future<List<PuzzleItem>?>? getAllPuzzlesItems(int id) {
    // Fetch all puzzle items for the given puzzle ID from a mock local storage and return as a List<PuzzleItem>
    return Future.value([puzzleItem]);
  }

  @override
  Future<Puzzle?>? getPuzzleById(int id) {
    // Fetch the puzzle with the given ID from a mock local storage and return as a Puzzle object
    return Future.value(puzzle);
  }

  @override
  Future<PuzzleItem?>? getPuzzleItemById(int id) {
    // Fetch the puzzle item with the given ID from a mock local storage and return as a PuzzleItem object
    return Future.value(puzzleItem);
  }

  @override
  Future<void> insertPuzzle(Puzzle puzzle) {
    // Insert the puzzle into a mock local storage
    return Future.value();
  }

  @override
  Future<void> insertPuzzleItem(PuzzleItem puzzleItem) {
    // Insert the puzzle item into a mock local storage
    return Future.value();
  }

  @override
  Stream<List<Puzzle>?>? streamAllPuzzles() {
    // Stream all puzzles from a mock local storage and return as a Stream<List<Puzzle>>
    return Stream.value([]);
  }

  @override
  Stream<List<PuzzleItem>?>? streamAllPuzzlesItems(int id) {
    // Stream all puzzle items for the given puzzle ID from a mock local storage and return as a Stream<List<PuzzleItem>>
    return Stream.value([puzzleItem]);
  }

  @override
  Future<void> updatePuzzle(Puzzle puzzle) {
    // Update the puzzle in a mock local storage
    return Future.value();
  }

  @override
  Future<void> updatePuzzleItem(PuzzleItem puzzleItem) {
    // Update the puzzle item in a mock local storage
    return Future.value();
  }
}

// Test data
final puzzle = Puzzle(
  id: 1,
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  puzzleType: 'Type 1',
);

final puzzleItem = PuzzleItem(
  id: 1,
  puzzleId: 1,
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
  choices: const ['Item 1'],
);
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockLocalStoragePuzzlesApi localStoragePuzzlesApi;
  setUp(() {
    localStoragePuzzlesApi = MockLocalStoragePuzzlesApi();
  });

  // Tests for LocalStoragePuzzlesApi
  test('Insert puzzle', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final retrievedPuzzle = await localStoragePuzzlesApi.getPuzzleById(1);
    expect(retrievedPuzzle, equals(puzzle));
  });

  test('Update puzzle', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final updatedPuzzle = puzzle.copyWith(puzzleType: 'Type 1');
    await localStoragePuzzlesApi.updatePuzzle(updatedPuzzle);
    final retrievedPuzzle = await localStoragePuzzlesApi.getPuzzleById(1);
    expect(retrievedPuzzle?.puzzleType, equals('Type 1'));
  });
// TODO: test delete puzzle
  // test('Delete puzzle', () async {
  //   // Insert the puzzle into local storage
  //   await localStoragePuzzlesApi.insertPuzzle(puzzle);

  //   // Delay to allow time for the puzzle to be inserted
  //   await Future.delayed(Duration(seconds: 2));

  //   // Delete the puzzle from local storage
  //   await localStoragePuzzlesApi.deletePuzzle(puzzle);

  //   // Delay to allow time for the puzzle to be deleted
  //   await Future.delayed(Duration(seconds: 2));

  //   // Get the retrieved puzzle
  //   final retrievedPuzzle = await localStoragePuzzlesApi.getPuzzleById(1);

  //   // Print the retrieved puzzle for debugging
  //   print('retrievedPuzzle: $retrievedPuzzle');

  //   // Check if the retrieved puzzle is null
  //   expect(retrievedPuzzle, isNull);
  // });

  test('Get all puzzles', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final puzzles = await localStoragePuzzlesApi.getAllPuzzles();
    expect(puzzles?.length, equals(1));
    expect(puzzles?.first, equals(puzzle));
  });

  test('Get all puzzles', () async {
    // Insert the puzzle into local storage
    await localStoragePuzzlesApi.insertPuzzle(puzzle);

    // Delay to allow time for the stream to emit the puzzle
    await Future.delayed(Duration(seconds: 2));

    // Get the first emitted value from the stream
    final puzzles = await localStoragePuzzlesApi.getAllPuzzles();

    // Print the puzzles for debugging
    print('puzzles: $puzzles');

    // Check the length of the puzzles list
    expect(puzzles?.length, equals(1));

    // Check if the first puzzle in the list matches the expected puzzle
    expect(puzzles?.first, equals(puzzle));
  });

  // Tests for PuzzleItem
  test('Insert puzzleItem', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    await localStoragePuzzlesApi.insertPuzzleItem(puzzleItem);
    final retrievedPuzzleItem =
        await localStoragePuzzlesApi.getPuzzleItemById(1);
    expect(retrievedPuzzleItem, equals(puzzleItem));
  });
}
