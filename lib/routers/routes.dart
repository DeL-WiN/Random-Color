import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:random_color/screens/history_color_page/page.dart';
import 'package:random_color/screens/main_page/bloc.dart';
import 'package:random_color/screens/main_page/page.dart';
import 'package:random_color/screens/splash_page/page.dart';




part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(path: '/main', page: MainRoute.page),
    AutoRoute(path: '/history', page: HistoryColorRoute.page),
  ];
}

// dart run build_runner watch
// dart run build_runner build
