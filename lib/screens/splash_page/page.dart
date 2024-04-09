import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:random_color/generated/assets.gen.dart';
import 'package:random_color/style.dart';
import 'package:random_color/utils/spaces.dart';
import 'package:random_color/widgets/custom_gif.dart';
import 'package:random_color/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashBloc bloc = SplashBloc();

  @override
  void initState() {
    bloc.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: CustomGif(
            gif: Assets.images.logo.image(),
          )),
          Space.h24,
          Text('Random Color', style: BS.bold24, textAlign: TextAlign.center),
        ],
      ),
    ));
  }
}
