import 'package:puzzles_api/puzzles_api.dart';
import 'package:test/test.dart';

void main() {
  group('Puzzle', () {
    Puzzle createSubject({
      int? id = 1,
      String? puzzleType = 'xoxoxx',
      String? createdAt = '2023/04/07',
      String? completedAt = '2023/04/07',
      int? lengthOfCharacters = 1,
      int? durationInSeconds = 1,
      int? noOfPuzzleItems = 1,
    }) {
      return Puzzle(
        id: id,
        puzzleType: puzzleType,
        createdAt: createdAt,
        completedAt: completedAt,
        lengthOfCharacters: lengthOfCharacters,
        durationInSeconds: durationInSeconds,
        noOfPuzzleItems: noOfPuzzleItems,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      // test('throws AssertionError when id is empty', () {
      //   expect(
      //     createSubject(id: null),
      //     throwsA(isA<AssertionError>()),
      //   );
      // });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          1, // id
          'xoxoxx', // puzzle_type
          '2023/04/07', // created_at
          '2023/04/07', // completed_at
          1, //lengthOfCharacters
          1, //durationInSeconds
          1 //noOfPuzzles
        ]),
      );
    });
    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });
      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            id: 2,
            puzzleType: 'puzzleType',
            createdAt: 'createdAt',
            completedAt: 'completedAt',
            lengthOfCharacters: 2,
            durationInSeconds: 2,
            noOfPuzzleItems: 2,
          ),
          equals(
            createSubject(
              id: 2,
              puzzleType: 'puzzleType',
              createdAt: 'createdAt',
              completedAt: 'completedAt',
              lengthOfCharacters: 2,
              durationInSeconds: 2,
              noOfPuzzleItems: 2,
            ),
          ),
        );
      });
      group('fromJson', () {
        test('works correctly', () {
          expect(
            Puzzle.fromJson(<String, dynamic>{
              'id': 1,
              'puzzle_type': 'xoxoxx',
              'created_at': '2023/04/07',
              'completed_at': '2023/04/07',
              'length_of_characters': 1, //lengthOfCharacters
              'duration_in_seconds': 1, //durationInSeconds
              'no_of_puzzle_items': 1 //noOfPuzzles
            }),
            equals(createSubject()),
          );
        });
      });

      group('toJson', () {
        test('works correctly', () {
          expect(
            createSubject().toJson(),
            equals(<String, dynamic>{
              'id': 1,
              'puzzle_type': 'xoxoxx',
              'created_at': '2023/04/07',
              'completed_at': '2023/04/07',
              'length_of_characters': 1, //lengthOfCharacters
              'duration_in_seconds': 1, //durationInSeconds
              'no_of_puzzle_items': 1 //noOfPuzzles
            }),
          );
        });
      });
    });
  });
}
