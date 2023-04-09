// ignore_for_file: prefer_const_constructors

import 'package:test/test.dart';
import 'package:words_generator/words_generator.dart';

void main() {
  // Test the generateWord method
  test('Test generateWord', () {
    final wordsGenerator = WordsGenerator();

    // Test case 1: Generate word with length 7
    final word1 = wordsGenerator.generateWord(7);
    expect(word1, isA<String>());
    expect(word1.length, 7);

    // Test case 2: Generate word with length 7
    final word2 = wordsGenerator.generateSimilarWord(word1);
    expect(word2, isA<String>());
    expect(word2.length, 7);
  });

  // Test the generateSimilarWord method
  test('Test randomWordsGenerator', () async {
    final wordsGenerator = WordsGenerator();

    // Test case 1: Generate similar word for 'WORD'
    final words = await wordsGenerator.randomWordsGenerator(5);
    expect(words, isA<List<String>>());

    // Test case 2: Check the words are of the given length

    expect(words[0].length, equals(words[1].length));
  });
}
