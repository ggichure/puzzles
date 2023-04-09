// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:xoxo_generator/xoxo_generator.dart';
import 'package:xoxo_repository/xoxo_repository.dart';

void main() {
  group('XoxoRepository', () {
    final xoxoGenerator = MockXoxoGenerator();
    test('can be instantiated', () {
      expect(XoxoRepository(xoxoGenerator: xoxoGenerator), isNotNull);
    });

    test('Can generate random xoxo', () async {
      final xoxoRepository = XoxoRepository(xoxoGenerator: xoxoGenerator);
      final result = await xoxoRepository.randomXOXOGenerator(5);
      // Verify the result
      expect(result, isA<List<String>>());
      expect(result.length, equals(2));
      expect(result[0], equals('xoxox'));
      expect(result[1], equals('xoxox'));
    });
  });
}

class MockXoxoGenerator extends Mock implements XoxoGenerator {
  @override
  Future<List<String>> randomXOXOGenerator(int? length) {
    return Future.value(['xoxox', 'xoxox']);
  }
}
