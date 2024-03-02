import 'package:flutter/material.dart';

class ParallaxBackdrop extends StatelessWidget {
  final String imageUrl;
  final int index;

  const ParallaxBackdrop({
    super.key,
    required this.controller,
    required this.imageUrl,
    required this.index,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()
        ..translate(
          0.0,
          controller.hasClients
              ? (-(index * MediaQuery.of(context).size.height) +
                      controller.position.pixels) /
                  2
              : 0.0,
        ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      ),
    );
  }
}
