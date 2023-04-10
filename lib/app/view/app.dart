import 'package:flutter/material.dart';
import 'package:puzzles/counter/counter.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PuzzlesTheme.light,
      darkTheme: PuzzlesTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
