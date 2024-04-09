import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:random_color/api/color_dto.dart';
import 'package:random_color/screens/main_page/bloc.dart' as main;
import 'package:random_color/style.dart';
import 'package:random_color/utils/custom_stream_builder.dart';
import 'package:random_color/utils/spaces.dart';
import 'package:random_color/widgets/custom_indicator.dart';
import 'package:random_color/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class HistoryColorPage extends StatefulWidget {
  final main.MainBloc mainBloc;

  const HistoryColorPage({super.key, required this.mainBloc});

  @override
  State<HistoryColorPage> createState() => _HistoryColorPageState();
}

class _HistoryColorPageState extends State<HistoryColorPage> {
  final HistoryColorBloc bloc = HistoryColorBloc();

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
          return state.loading
              ? const CustomIndicator()
              : CustomScaffold(
                  body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _CustomBackButton(
                              onTap: () => context.router.popForced()),
                          const Spacer(),
                          _CustomClearButton(onTap: () => bloc.clear()),
                        ],
                      ),
                      Space.h16,
                      Text('History', style: BS.bold24),
                      Space.h16,
                      Expanded(
                          child: (state.listColor.isNotEmpty)
                              ? ListView.builder(
                                  itemCount: state.listColor.length,
                                  itemBuilder: (context, index) {
                                    final color = state.listColor[index];
                                    return _ColorContainer(
                                        onTap: () => bloc.selectColor(
                                            color, context, widget.mainBloc),
                                        color: color);
                                  })
                              : Center(
                                  child: Text(
                                    'History is empty',
                                    style: BS.bold24,
                                  ),
                                )),
                    ],
                  ),
                ));
        });
  }
}

class _ColorContainer extends StatelessWidget {
  final ColorDto color;
  final Function()? onTap;

  const _ColorContainer({super.key, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BRadius.r16,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.color,
              radius: 16,
            ),
            Space.w16,
            Text('${color.id} - ${color.color.toString()}', style: BS.light16),
          ],
        ),
      ),
    );
  }
}

class _CustomBackButton extends StatelessWidget {
  final Function()? onTap;

  const _CustomBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
          Text('Back', style: BS.light16),
        ],
      ),
    );
  }
}

class _CustomClearButton extends StatelessWidget {
  final Function()? onTap;

  const _CustomClearButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text('Clear', style: BS.light16),
          Space.w8,
          const Icon(Icons.delete, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
