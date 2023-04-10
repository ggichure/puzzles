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
