import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:puzzles/home/view/view.dart';
import 'package:puzzles/puzzles/puzzles.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AdaptiveRoute>[
    AdaptiveRoute<dynamic>(page: HomePage, initial: true),
    // puzzles
    AdaptiveRoute<dynamic>(
      page: LetterPuzzleConfigurePage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
