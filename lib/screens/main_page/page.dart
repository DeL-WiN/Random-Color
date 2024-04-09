import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:random_color/style.dart';
import 'package:random_color/utils/custom_stream_builder.dart';
import 'package:random_color/utils/spaces.dart';
import 'package:random_color/widgets/custom_indicator.dart';
import 'package:random_color/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return (state.loading) ? const CustomIndicator() : CustomScaffold(
              backgroundColor: state.color,
              body: InkWell(
            splashColor: Colors.transparent,
            onTap: () => bloc.changeColor(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => bloc.goToHistory(context, bloc),
                        child: const Icon(Icons.history,
                            color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: Text('Hello', style: BS.bold24),
                  ),
                  const Spacer(),
                  Space.h24,
                ],
              ),
            ),
          ));
        });
  }
}
