import 'package:flutter/material.dart';
import 'package:gif/gif.dart';


// Center(
// child: CustomGif(
// gif: Assets.images.cool.image(),
// ));

class CustomGif extends StatefulWidget {
  final Image gif;
  const CustomGif({super.key, required this.gif});

  @override
  State<CustomGif> createState() => _CustomGifState();
}

class _CustomGifState extends State<CustomGif> with TickerProviderStateMixin {
  late GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: widget.gif.image,
      controller: controller,
      fps: 30,
      autostart: Autostart.loop,
      placeholder: (context) => const SizedBox(),
      onFetchCompleted: () {
        controller.reset();
      },
    );
  }
}
