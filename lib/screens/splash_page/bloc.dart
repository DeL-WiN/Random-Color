import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:random_color/routers/routes.dart';
import 'package:random_color/utils/bloc_base.dart';

class SplashBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  SplashBloc() {
    setState(ScreenState());
  }

  void init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) context.router.replaceAll([const MainRoute()]);
  }
}

class ScreenState {
  final bool loading;

  ScreenState({this.loading = false});

  ScreenState copyWith({bool? loading}) {
    return ScreenState(loading: loading ?? this.loading);
  }
}
