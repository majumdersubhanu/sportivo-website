import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class CustomNeoPopTileButton extends StatelessWidget {
  final String? label;
  final void Function()? onTap;
  const CustomNeoPopTileButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NeoPopTiltedButton(
      isFloating: true,
      color: Colors.white,
      onTapUp: () => HapticFeedback.vibrate(),
      onTapDown: () {
        HapticFeedback.vibrate();
        onTap;
      },
      floatingDuration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          label ?? "Read More",
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
