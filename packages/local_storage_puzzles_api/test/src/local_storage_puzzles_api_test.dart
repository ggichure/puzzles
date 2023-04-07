// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/local_storage_puzzles_api.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:puzzles_api/puzzles_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Initialize test database
  final database = MyDatabase();

  // Initialize LocalStoragePuzzlesApi with test database
  final localStoragePuzzlesApi = LocalStoragePuzzlesApi(
    puzzlesDao: database.puzzlesDao,
    puzzlesItemDao: database.puzzlesItemDao,
  );

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
    choices: ['Item 1'],
  );

  // Tests for LocalStoragePuzzlesApi
  test('Insert puzzle', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final retrievedPuzzle = await localStoragePuzzlesApi.getPuzzleById(1);
    expect(retrievedPuzzle, equals(puzzle));
  });

  test('Update puzzle', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final updatedPuzzle = puzzle.copyWith(puzzleType: 'Type 2');
    await localStoragePuzzlesApi.updatePuzzle(updatedPuzzle);
    final retrievedPuzzle = await localStoragePuzzlesApi.getPuzzleById(1);
    expect(retrievedPuzzle?.puzzleType, equals('Type 2'));
  });

  test('Delete puzzle', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    await localStoragePuzzlesApi.deletePuzzle(puzzle);
    final retrievedPuzzle = await localStoragePuzzlesApi.getPuzzleById(1);
    expect(retrievedPuzzle, isNull);
  });

  test('Get all puzzles', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final puzzles = await localStoragePuzzlesApi.getAllPuzzles();
    expect(puzzles?.length, equals(1));
    expect(puzzles?.first, equals(puzzle));
  });

  test('Stream all puzzles', () async {
    await localStoragePuzzlesApi.insertPuzzle(puzzle);
    final puzzles = await localStoragePuzzlesApi.streamAllPuzzles()?.first;
    expect(puzzles?.length, equals(1));
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
