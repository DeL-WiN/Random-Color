import 'package:flutter/material.dart';


class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {this.appBar, required this.body, this.bottomNavigationBar, super.key, this.backgroundColor});

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      body: SafeArea(child: body),
    );
  }
}
