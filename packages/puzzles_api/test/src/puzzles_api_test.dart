// ignore_for_file: prefer_const_constructors
import 'package:puzzles_api/puzzles_api.dart';
import 'package:test/test.dart';

class TestTodosApi extends PuzzlesApi {
  TestTodosApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('PuzzlesApi', () {
    test('can be constructed', () {
      expect(TestTodosApi.new, returnsNormally);
    });
  });
}
