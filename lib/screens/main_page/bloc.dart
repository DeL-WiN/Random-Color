import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:random_color/api/cache.dart';
import 'package:random_color/api/color_dto.dart';
import 'package:random_color/routers/routes.dart';
import 'package:random_color/utils/bloc_base.dart';

class MainBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();
  final Random random = Random();

  MainBloc() {
    setState(ScreenState());
  }

  void init() async {
    setState(currentState.copyWith(loading: true));
    final listColor = await cache.getListColor();
    if(listColor.isNotEmpty) {
      setState(currentState.copyWith(color: listColor.last.color, loading: false));
    } else {
      setState(currentState.copyWith(loading: false));
    }
  }

  void changeColor() async {
    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);
    final color = Color.fromRGBO(r, g, b, 1);
    setState(currentState.copyWith(color: color));
    await cache.saveListColor(color);
  }

  void goToHistory(BuildContext context, MainBloc mainBloc) {
    context.router.push( HistoryColorRoute(mainBloc: mainBloc));
  }

  void selectColor(ColorDto colorDto) async {
    setState(currentState.copyWith(color: colorDto.color));
  }
}

class ScreenState {
  final bool loading;
  final Color color;

  ScreenState({this.loading = false, this.color = Colors.black});

  ScreenState copyWith({bool? loading, Color? color}) {
    return ScreenState(
        loading: loading ?? this.loading, color: color ?? this.color);
  }
}
