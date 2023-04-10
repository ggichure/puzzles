import 'package:flutter/material.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/router/app_router.dart';
import 'package:puzzles/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      theme: PuzzlesTheme.light,
      darkTheme: PuzzlesTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
