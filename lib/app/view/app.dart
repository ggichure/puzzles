import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/router/app_router.dart';
import 'package:puzzles/theme/theme.dart';
import 'package:puzzles_repository/puzzles_repository.dart';
import 'package:words_generator/words_generator.dart';
import 'package:words_generator_repository/words_generator_repository.dart';

class App extends StatefulWidget {
  const App({super.key, required this.puzzlesRepository});
  final PuzzlesRepository puzzlesRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late WordsGenerator wordsGenerator;
  @override
  void initState() {
    wordsGenerator = const WordsGenerator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: widget.puzzlesRepository,
        ),
        RepositoryProvider(
          create: (context) =>
              WordsGeneratorRepository(wordsGenerator: wordsGenerator),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        routeInformationProvider: appRouter.routeInfoProvider(),
        theme: PuzzlesTheme.light,
        darkTheme: PuzzlesTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
