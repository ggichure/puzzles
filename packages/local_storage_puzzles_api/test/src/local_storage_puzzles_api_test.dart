import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_puzzles_api/local_storage_puzzles_api.dart';
import 'package:local_storage_puzzles_api/src/database/db.dart';
import 'package:local_storage_puzzles_api/src/database/puzzles_dao.dart';
import 'package:mockito/mockito.dart';
import 'package:puzzles_api/puzzles_api.dart';

final testData = [
  PuzzlesModelTableData(id: 1, puzzle: puzzle),
  PuzzlesModelTableData(id: 2, puzzle: puzzle)
];

class MockPuzzlesDao extends Mock implements PuzzlesDao {}

class MockLocalStoragePuzzlesApi implements LocalStoragePuzzlesApi {
  const MockLocalStoragePuzzlesApi({
    required MockPuzzlesDao puzzlesDao,
  }) : _puzzlesDao = puzzlesDao;
  final MockPuzzlesDao _puzzlesDao;

  @override
  Future<void> deleteAllPuzzles() {
    // TODO: implement deleteAllPuzzles
    throw UnimplementedError();
  }

  @override
  Future<void> deletePuzzle(int puzzleId) {
    // TODO: implement deletePuzzle
    throw UnimplementedError();
  }

  @override
  Future<void> deletePuzzleItem(int puzzleItemId) {
    // TODO: implement deletePuzzleItem
    throw UnimplementedError();
  }

  @override
  Stream<List<PuzzlesModelTableData>> getPuzzles() async* {
    yield* Stream.value(testData);
  }

  @override
  Stream<List<PuzzlesItemsModelTableData>> getPuzzlesItems(int puzzleId) {
    // TODO: implement getPuzzlesItems
    throw UnimplementedError();
  }

  @override
  Future<void> savePuzzle(PuzzlesModelTableData? puzzlesModelTableData) {
    // TODO: implement savePuzzle
    throw UnimplementedError();
  }

  @override
  Future<void> savePuzzleItems(
      PuzzlesItemsModelTableData? puzzlesItemsModelTableData) {
    // TODO: implement savePuzzleItems
    throw UnimplementedError();
  }
}

final puzzle = PuzzlesModel(
  id: 1,
  puzzleType: 'XOXO',
  createdAt: DateTime.now().toString(),
  completedAt: DateTime.now().toString(),
);

final puzzleItem = PuzzlesItemModel(
  id: 1,
  puzzleId: 1,
  puzzleType: 'XOXO',
  isCorrect: true,
  choices: const ['XOXOOOO', 'XXOOOXOX'],
  createdAt: DateTime.now().toString(),
  completedAt: DateTime.now().toString(),
);
void main() {
  late MockLocalStoragePuzzlesApi localStoragePuzzlesApi;
  late MockPuzzlesDao mockPuzzlesDao;

  setUp(() {
    mockPuzzlesDao = MockPuzzlesDao();
    localStoragePuzzlesApi =
        MockLocalStoragePuzzlesApi(puzzlesDao: mockPuzzlesDao);
  });

  test('getPuzzles returns the correct stream', () {
    when(mockPuzzlesDao.getPuzzles());

    expect(localStoragePuzzlesApi.getPuzzles(), emitsInOrder([testData]));
  });

  // test('savePuzzle calls the correct method', () async {
  //   final testData = PuzzlesModelTableData(id: 1, puzzle: puzzle);
  //   await localStoragePuzzlesApi.savePuzzle(testData);

  //   verify(mockPuzzlesDao.savePuzzle(testData)).called(1);
  // });

  // test('savePuzzleItems calls the correct method', () async {
  //   final testData =
  //       PuzzlesItemsModelTableData(id: 1, puzzleId: 1, puzzleItem: puzzleItem);
  //   await localStoragePuzzlesApi.savePuzzleItems(testData);

  //   verify(mockPuzzlesDao.savePuzzleItems(testData)).called(1);
  // });

  // test('deletePuzzleItem calls the correct method', () async {
  //   final testId = 1;
  //   await localStoragePuzzlesApi.deletePuzzleItem(testId);

  //   verify(mockPuzzlesDao.deletePuzzleItem(testId)).called(1);
  // });

  // test('deleteAllPuzzles calls the correct method', () async {
  //   await localStoragePuzzlesApi.deleteAllPuzzles();

  //   verify(mockPuzzlesDao.deleteAllPuzzles()).called(1);
  // });

  // test('deletePuzzle calls the correct method', () async {
  //   final testId = 1;
  //   await localStoragePuzzlesApi.deletePuzzle(testId);

  //   verify(mockPuzzlesDao.deletePuzzle(testId)).called(1);
  // });

  // test('getPuzzlesItems returns the correct stream', () {
  //   final testData = [
  //     PuzzlesItemsModelTableData(id: 1, puzzleId: 1, puzzleItem: puzzleItem),
  //     PuzzlesItemsModelTableData(id: 2, puzzleId: 1, puzzleItem: puzzleItem)
  //   ];
  //   when(mockPuzzlesDao.getPuzzlesItems(1))
  //       .thenAnswer((_) => Stream.value(testData));

  //   expect(localStoragePuzzlesApi.getPuzzlesItems(1), emitsInOrder([testData]));
  // });
}
