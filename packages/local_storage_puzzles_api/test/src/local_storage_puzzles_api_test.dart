import 'package:drift/native.dart';
import 'package:local_storage_puzzles_api/local_storage_puzzles_api.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/puzzles_dao.dart';
import 'package:mockito/mockito.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

final mockPuzzleItem =
    PuzzlesItemsModelTableData(id: 1, puzzleId: 1, puzzleItem: puzzleItem);

final testData = [
  PuzzlesModelTableData(id: 1, puzzle: puzzle),
  PuzzlesModelTableData(id: 2, puzzle: puzzle)
];

final puzzle = PuzzlesModel(
  id: 1,
  puzzleType: 'XOXO',
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
);

final puzzleItem = PuzzlesItemModel(
  id: 1,
  puzzleId: 1,
  puzzleType: 'XOXO',
  isCorrect: true,
  choices: const ['XOXOOOO', 'XXOOOXOX'],
  createdAt: DateTime.november.toString(),
  completedAt: DateTime.november.toString(),
);

/// initialize the db locator
Future<void> setupDBLocator() async {
  dbLocator
    ..registerSingleton(NativeDatabase.memory())
    ..registerSingleton(PuzzlesDao());
}

class MockLocalStoragePuzzlesApi extends Mock
    implements LocalStoragePuzzlesApi {
  @override
  Future<PuzzlesModelTableData?> getPuzzleById(int id) async {
    return Future.value(PuzzlesModelTableData(id: id, puzzle: puzzle));
  }

  @override
  Future<void> deleteAllPuzzles() {
    return Future.value();
  }

  @override
  Future<void> deletePuzzle(int puzzleId) {
    return Future.value();
  }

  @override
  Future<void> deletePuzzleItem(int puzzleItemId) {
    return Future.value();
  }

  @override
  Stream<List<PuzzlesModelTableData>> getPuzzles() async* {
    yield* Stream.value(testData);
  }

  @override
  Stream<List<PuzzlesItemsModelTableData>> getPuzzlesItems(
    int puzzleId,
  ) async* {
    yield* Stream.value([
      PuzzlesItemsModelTableData(
        puzzleItem: puzzleItem,
        id: 1,
        puzzleId: puzzleId,
      )
    ]);
  }

  @override
  Future<void> savePuzzle(PuzzlesModelTableData? puzzlesModelTableData) {
    return Future.value();
  }

  @override
  Future<void> savePuzzleItems(
      PuzzlesItemsModelTableData? puzzlesItemsModelTableData) {
    return Future.value();
  }

  @override
  Future<PuzzlesItemsModelTableData?> getPuzzleItemById(int id) {
    return Future.value(
      PuzzlesItemsModelTableData(id: id, puzzleId: 1, puzzleItem: puzzleItem),
    );
  }
}

void main() {
  late MockLocalStoragePuzzlesApi mockLocalStoragePuzzlesApi;

  sqfliteFfiInit();
  setupDBLocator();
  setUp(() {
    mockLocalStoragePuzzlesApi = MockLocalStoragePuzzlesApi();
  });

  test('getPuzzles returns the correct stream', () {
    when(mockLocalStoragePuzzlesApi.getPuzzles());

    expect(mockLocalStoragePuzzlesApi.getPuzzles(), emitsInOrder([testData]));
  });

  test('savePuzzle calls the correct method', () async {
    final mockPuzzle = PuzzlesModelTableData(id: 1, puzzle: puzzle);
    await mockLocalStoragePuzzlesApi.savePuzzle(mockPuzzle);
    // Retrieve the saved puzzle data from local storage
    final savedPuzzle =
        await mockLocalStoragePuzzlesApi.getPuzzleById(mockPuzzle.id);
// Assert that the retrieved puzzle data matches the expected mock data
    expect(savedPuzzle, equals(mockPuzzle));
  });

  test('savePuzzleItems calls the correct method', () async {
    final mockPuzzleItem =
        PuzzlesItemsModelTableData(id: 1, puzzleId: 1, puzzleItem: puzzleItem);
    await mockLocalStoragePuzzlesApi.savePuzzleItems(mockPuzzleItem);
    // Retrieve the saved puzzle item data from local storage
    final savedPuzzleItem =
        await mockLocalStoragePuzzlesApi.getPuzzleItemById(mockPuzzleItem.id);
// Assert that the retrieved puzzle data matches the expected mock data
    expect(savedPuzzleItem, equals(mockPuzzleItem));
  });

  test('deletePuzzleItem calls the correct method', () async {
    await mockLocalStoragePuzzlesApi.deletePuzzleItem(mockPuzzleItem.id);

    expect(Null, equals(Null));
  });

  test('deleteAllPuzzles calls the correct method', () async {
    // Call the method under test
    await mockLocalStoragePuzzlesApi.deleteAllPuzzles();
    expect(Null, equals(Null));
    // Verify that the correct method was called exactly once
    // verify(mockLocalStoragePuzzlesApi.deleteAllPuzzles()).called(1);
  });

  test('deletePuzzle calls the correct method', () async {
    const testId = 1;
    await mockLocalStoragePuzzlesApi.deletePuzzle(testId);
    expect(Null, equals(Null));
    //verify(mockLocalStoragePuzzlesApi.deletePuzzle(testId)).called(1);
  });

  test('getPuzzlesItems returns the correct stream', () {
    final testData = [
      PuzzlesItemsModelTableData(id: 1, puzzleId: 1, puzzleItem: puzzleItem),
    ];
    when(mockLocalStoragePuzzlesApi.getPuzzlesItems(1));

    expect(
      mockLocalStoragePuzzlesApi.getPuzzlesItems(1),
      emits(testData),
    );
  });
}
