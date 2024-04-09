import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/style.dart';
import 'package:random_color/widgets/custom_scaffold.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(child: CircularProgressIndicator(
        color: BC.white,
        strokeWidth: 2,
      ),),
    );
  }
}
