import 'dart:math';

/// {@template xoxo_generator}
/// An API  that handles xoxo  generation  related requests.
/// {@endtemplate}
class XoxoGenerator {
  /// {@macro xoxo_generator}
  const XoxoGenerator();

  /// [randomXOXOGenerator] generates random [String]s of xoxo
  /// Using [Random] if even make words similar else switcharoo one letter
  ///
  /// [length] is used to count no of characters with 4 being min
  Future<List<String>> randomXOXOGenerator(int? length) async {
    assert(length == null || length > 4, 'Length must be greater than 4');

    final random = Random();

    /// generate similar xoxo's
    if (random.nextInt(100).isEven) {
      final word1 = generateMixedXOXO(length);
      return [word1, word1];
    } else {
      final word1 = generateMixedXOXO(length);
      final word2 = generateSimilarXOXO(word1);
      return [word1, word2];
    }
  }

  /// Used to generate first Word
  /// if [length] generate up to 4
  String generateMixedXOXO(int? length) {
    final random = Random();
    var word = '';
    for (var i = 0; i < (length ?? 4); i++) {
      final char = (random.nextInt(100).isEven) ? 'x' : 'o';
      // ignore: use_string_buffers
      word += char;
    }
    return word;
  }

  /// Used to generate 2nd word from first word
  /// Its tweak a bit
  String generateSimilarXOXO(String originalWord) {
    final random = Random();
    var word = originalWord;
    final index = random.nextInt(word.length - 2) + 1;
    final oldChar = word[index];
    final newChar = (oldChar == 'x') ? 'o' : 'x';
    // ignore: join_return_with_assignment
    word = word.substring(0, index) + newChar + word.substring(index + 1);
    return word;
  }
}
