import 'package:words_generator/words_generator.dart';

/// {@template words_generator_repository}
/// A repository that handles words generation  related requests.
/// {@endtemplate}
class WordsGeneratorRepository {
  /// {@macro words_generator_repository}
  const WordsGeneratorRepository({required WordsGenerator wordsGenerator})
      : _wordsGenerator = wordsGenerator;
  final WordsGenerator _wordsGenerator;

  /// [randomWordsGenerator] generates random [String]s of letters(words)
  // ignore: comment_references
  /// Using [Random] if even make words similar else switcharoo one letter
  ///
  /// [length] is used to count no of characters with 4 being min
  Future<List<String>> randomWordsGenerator(int? length) =>
      _wordsGenerator.randomWordsGenerator(length);
}
