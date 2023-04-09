import 'dart:math';

/// {@template words_generator}
/// An API  that handles words generation  related requests.
/// {@endtemplate}
class WordsGenerator {
  /// {@macro words_generator}
  const WordsGenerator();

  /// [randomWordsGenerator] generates random [String]s of letters(words)
  /// Using [Random] if even make words similar else switcharoo one letter
  ///
  /// [length] is used to count no of characters with 4 being min
  Future<List<String>> randomWordsGenerator(int? length) async {
    final random = Random();
    if (random.nextInt(100).isEven) {
      final word1 = generateWord(length);

      return [word1, word1];
    } else {
      final word1 = generateWord(length);
      final word2 = generateSimilarWord(word1);
      return [word1, word2];
    }
  }

  /// Used to generate first Word
  /// if [length] generate upto 4
  String generateWord(int? length) {
    final random = Random();
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var word = '';
    for (var i = 0; i < (length ?? 4); i++) {
      final letter = alphabet[random.nextInt(alphabet.length)];
      // ignore: use_string_buffers
      word += letter;
    }
    return word;
  }

  /// USed to generate 2nd word from first word
  String generateSimilarWord(String originalWord) {
    final random = Random();
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var word = originalWord;
    final index = random.nextInt(word.length - 2) + 1;
    final oldLetter = word[index];
    var newLetter = oldLetter;
    while (newLetter == oldLetter) {
      newLetter = alphabet[random.nextInt(alphabet.length)];
    }
    // ignore: join_return_with_assignment
    word = word.substring(0, index) + newLetter + word.substring(index + 1);
    return word;
  }
}
