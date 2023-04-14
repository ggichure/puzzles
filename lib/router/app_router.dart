import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:puzzles/home/view/view.dart';
import 'package:puzzles/puzzles/puzzles.dart';
import 'package:puzzles/puzzles/views/letter_puzzles/letter_puzzles_play_page.dart';
import 'package:puzzles/puzzles/views/puzzles_history_page.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AdaptiveRoute>[
    AdaptiveRoute<dynamic>(page: HomePage, initial: true),
    // puzzles
    AdaptiveRoute<dynamic>(
      page: LetterPuzzleConfigurePage,
    ),
    AdaptiveRoute(
      page: PuzzlesHistoryPage,
    ),
    AdaptiveRoute(
      page: LettersPuzzlesPlayPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
