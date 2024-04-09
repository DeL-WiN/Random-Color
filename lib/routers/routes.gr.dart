// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HistoryColorRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryColorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HistoryColorPage(
          key: args.key,
          mainBloc: args.mainBloc,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [HistoryColorPage]
class HistoryColorRoute extends PageRouteInfo<HistoryColorRouteArgs> {
  HistoryColorRoute({
    Key? key,
    required MainBloc mainBloc,
    List<PageRouteInfo>? children,
  }) : super(
          HistoryColorRoute.name,
          args: HistoryColorRouteArgs(
            key: key,
            mainBloc: mainBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryColorRoute';

  static const PageInfo<HistoryColorRouteArgs> page =
      PageInfo<HistoryColorRouteArgs>(name);
}

class HistoryColorRouteArgs {
  const HistoryColorRouteArgs({
    this.key,
    required this.mainBloc,
  });

  final Key? key;

  final MainBloc mainBloc;

  @override
  String toString() {
    return 'HistoryColorRouteArgs{key: $key, mainBloc: $mainBloc}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
