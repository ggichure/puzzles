import 'package:flutter/material.dart';
import 'package:local_storage_puzzles_api/local_storage_puzzles_api.dart';
import 'package:puzzles/app/app.dart';
import 'package:puzzles/bootstrap.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final database = MyDatabase(openConnection());
  final puzzlesDao = PuzzlesDao(database);
  final puzzlesItemDao = PuzzlesItemDao(database);

  final localStoragePuzzlesApi = LocalStoragePuzzlesApi(
    puzzlesDao: puzzlesDao,
    puzzlesItemDao: puzzlesItemDao,
  );
  bootstrap(
    () => App(
      puzzlesRepository: PuzzlesRepository(
        localStoragePuzzlesApi: localStoragePuzzlesApi,
      ),
    ),
  );
}
