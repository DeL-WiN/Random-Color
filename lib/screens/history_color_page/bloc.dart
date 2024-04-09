import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:random_color/api/cache.dart';
import 'package:random_color/api/color_dto.dart';
import 'package:random_color/screens/main_page/bloc.dart';
import 'package:random_color/utils/bloc_base.dart';

class HistoryColorBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  final Cache cache = Cache();

  HistoryColorBloc() {
    setState(ScreenState());
  }

  void init() async {
    setState(ScreenState(loading: true));
    final listColor = await cache.getListColor();
    setState(currentState.copyWith(loading: false, listColor: listColor));
  }

  void clear() async {
    await cache.removeListColor();
    setState(currentState.copyWith(listColor: []));
  }

  void selectColor(ColorDto colorDto, BuildContext context, MainBloc mainBloc) async {
    mainBloc.selectColor(colorDto);
    context.router.popForced();
  }
}

class ScreenState {
  final bool loading;
  final List<ColorDto> listColor;

  ScreenState({this.loading = false, this.listColor = const []});

  ScreenState copyWith({bool? loading, List<ColorDto>? listColor}) {
    return ScreenState(loading: loading ?? this.loading, listColor: listColor ?? this.listColor);
  }
}
