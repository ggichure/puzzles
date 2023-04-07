import 'package:puzzles_api/puzzles_api.dart';
import 'package:test/test.dart';

void main() {
  group('Puzzle Item', () {
    PuzzleItem createSubject({
      int? id = 1,
      int? puzzleId = 1,
      List<String>? choices = const ['choices', 'choices'],
      String? puzzleType = 'xoxoxx',
      String? createdAt = '2023/04/07',
      String? completedAt = '2023/04/07',
    }) {
      return PuzzleItem(
        id: id,
        puzzleId: puzzleId,
        puzzleType: puzzleType,
        createdAt: createdAt,
        choices: choices,
        completedAt: completedAt,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
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
          1, //puzzleId
          ['choices', 'choices'], //choices
          'xoxoxx', // puzzle_type
          '2023/04/07', // created_at

          '2023/04/07', // completed_at
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
          ),
          equals(
            createSubject(
              id: 2,
              puzzleType: 'puzzleType',
              createdAt: 'createdAt',
              completedAt: 'completedAt',
            ),
          ),
        );
      });
      group('fromJson', () {
        test('works correctly', () {
          expect(
            PuzzleItem.fromJson(<String, dynamic>{
              'id': 1,
              'puzzle_type': 'xoxoxx',
              'choices': ['choices', 'choices'],
              'puzzle_id': 1,
              'created_at': '2023/04/07',
              'completed_at': '2023/04/07',
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
              'choices': ['choices', 'choices'],
              'puzzle_id': 1,
              'created_at': '2023/04/07',
              'completed_at': '2023/04/07',
            }),
          );
        });
      });
    });
  });
}
