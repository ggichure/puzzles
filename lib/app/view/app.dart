import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/router/app_router.dart';
import 'package:puzzles/theme/theme.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

class App extends StatelessWidget {
  const App({super.key, required this.puzzlesRepository});
  final PuzzlesRepository puzzlesRepository;
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return RepositoryProvider.value(
      value: puzzlesRepository,
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
