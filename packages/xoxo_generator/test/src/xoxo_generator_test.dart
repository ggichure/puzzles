// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:xoxo_generator/xoxo_generator.dart';

void main() {
  group('XoxoGenerator', () {
    test('can be instantiated', () {
      expect(XoxoGenerator(), isNotNull);
    });

    test('Can generate random xoxo and match iven length', () async {
      final xoxoGenerator = XoxoGenerator();
      // Test case 1: Generate word with length 7
      final word1 = await xoxoGenerator.randomXOXOGenerator(7);
      expect(word1, isA<List<String>>());
      expect(word1.first.length, 7);
      expect(word1[1].length, 7);
    });

    test('xoxo Generated xoxo that match length', () async {
      final xoxoGenerator = XoxoGenerator();
      // Test case 1: Generate word with length 7
      final word1 = xoxoGenerator.generateMixedXOXO(7);
      expect(word1, isA<String>());
      expect(word1.length, 7);

      // Test case 2: Generate word with length 7
      final word2 = xoxoGenerator.generateSimilarXOXO(word1);
      expect(word2, isA<String>());
      expect(word2.length, 7);
    });
  });
}
