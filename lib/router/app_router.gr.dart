// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
        opaque: true,
      );
    },
    LetterPuzzleConfigurePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const LetterPuzzleConfigurePage(),
        opaque: true,
      );
    },
    PuzzlesHistoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PuzzlesHistoryPageRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: PuzzlesHistoryPage(
          key: args.key,
          puzzleType: args.puzzleType,
        ),
        opaque: true,
      );
    },
    LettersPuzzlesPlayPageRoute.name: (routeData) {
      final args = routeData.argsAs<LettersPuzzlesPlayPageRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: LettersPuzzlesPlayPage(
          key: args.key,
          puzzle: args.puzzle,
          completed: args.completed,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomePageRoute.name,
          path: '/',
        ),
        RouteConfig(
          LetterPuzzleConfigurePageRoute.name,
          path: '/letter-puzzle-configure-page',
        ),
        RouteConfig(
          PuzzlesHistoryPageRoute.name,
          path: '/puzzles-history-page',
        ),
        RouteConfig(
          LettersPuzzlesPlayPageRoute.name,
          path: '/letters-puzzles-play-page',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [LetterPuzzleConfigurePage]
class LetterPuzzleConfigurePageRoute extends PageRouteInfo<void> {
  const LetterPuzzleConfigurePageRoute()
      : super(
          LetterPuzzleConfigurePageRoute.name,
          path: '/letter-puzzle-configure-page',
        );

  static const String name = 'LetterPuzzleConfigurePageRoute';
}

/// generated route for
/// [PuzzlesHistoryPage]
class PuzzlesHistoryPageRoute
    extends PageRouteInfo<PuzzlesHistoryPageRouteArgs> {
  PuzzlesHistoryPageRoute({
    Key? key,
    required PUZZLETYPE puzzleType,
  }) : super(
          PuzzlesHistoryPageRoute.name,
          path: '/puzzles-history-page',
          args: PuzzlesHistoryPageRouteArgs(
            key: key,
            puzzleType: puzzleType,
          ),
        );

  static const String name = 'PuzzlesHistoryPageRoute';
}

class PuzzlesHistoryPageRouteArgs {
  const PuzzlesHistoryPageRouteArgs({
    this.key,
    required this.puzzleType,
  });

  final Key? key;

  final PUZZLETYPE puzzleType;

  @override
  String toString() {
    return 'PuzzlesHistoryPageRouteArgs{key: $key, puzzleType: $puzzleType}';
  }
}

/// generated route for
/// [LettersPuzzlesPlayPage]
class LettersPuzzlesPlayPageRoute
    extends PageRouteInfo<LettersPuzzlesPlayPageRouteArgs> {
  LettersPuzzlesPlayPageRoute({
    Key? key,
    required Puzzle? puzzle,
    bool? completed,
  }) : super(
          LettersPuzzlesPlayPageRoute.name,
          path: '/letters-puzzles-play-page',
          args: LettersPuzzlesPlayPageRouteArgs(
            key: key,
            puzzle: puzzle,
            completed: completed,
          ),
        );

  static const String name = 'LettersPuzzlesPlayPageRoute';
}

class LettersPuzzlesPlayPageRouteArgs {
  const LettersPuzzlesPlayPageRouteArgs({
    this.key,
    required this.puzzle,
    this.completed,
  });

  final Key? key;

  final Puzzle? puzzle;

  final bool? completed;

  @override
  String toString() {
    return 'LettersPuzzlesPlayPageRouteArgs{key: $key, puzzle: $puzzle, completed: $completed}';
  }
}
