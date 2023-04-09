// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:words_generator/words_generator.dart';
import 'package:words_generator_repository/words_generator_repository.dart';

void main() async {
  // Test the randomWordsGenerator method in WordsGeneratorRepository
  test('Test randomWordsGenerator in WordsGeneratorRepository', () async {
    // Create a mock instance of WordsGenerator
    final mockWordsGenerator = MockWordsGenerator();
    final wordsGeneratorRepository =
        WordsGeneratorRepository(wordsGenerator: mockWordsGenerator);

    // Call the randomWordsGenerator method in WordsGeneratorRepository
    final result = await wordsGeneratorRepository.randomWordsGenerator(5);

    // Verify that the randomWordsGenerator method in WordsGeneratorRepository
    // called the same method in WordsGenerator

    // Verify the result
    expect(result, isA<List<String>>());
    expect(result.length, equals(2));
    expect(result[0], equals('word1'));
    expect(result[1], equals('word2'));
  });
}

// Define a mock class for WordsGenerator
class MockWordsGenerator extends Mock implements WordsGenerator {
  @override
  Future<List<String>> randomWordsGenerator(int? length) {
    return Future.value(['word1', 'word2']);
  }
}
