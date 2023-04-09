import 'package:xoxo_generator/xoxo_generator.dart';

/// {@template xoxo_repository}
/// A Repository  that handles xoxo  generation  related functions.
/// {@endtemplate}
class XoxoRepository {
  /// {@macro xoxo_repository}
  const XoxoRepository({required XoxoGenerator xoxoGenerator})
      : _xoxoGenerator = xoxoGenerator;
  final XoxoGenerator _xoxoGenerator;

  /// {@macro xoxo_randomXOXOGenerator}
  Future<List<String>> randomXOXOGenerator(int? length) =>
      _xoxoGenerator.randomXOXOGenerator(length);
}
