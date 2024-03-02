import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:sportivo_website/widgets/buttons.dart';
import 'package:sportivo_website/widgets/lorem_ipsum.dart';

class CallToActionSection extends StatelessWidget {
  const CallToActionSection({
    super.key,
    required this.header,
    this.content,
    this.label,
  });

  final String header;
  final Widget? content;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        blur: 4,
        border: const Border.fromBorderSide(BorderSide.none),
        shadowStrength: 5,
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(16),
        shadowColor: Colors.white.withOpacity(0.24),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
                    const Gap(20),
                    content ?? const LoremIpsum(),
                  ],
                ),
              ),
              CustomNeoPopTileButton(label: label),
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicSection extends StatelessWidget {
  final Widget content;

  const DynamicSection({
    super.key,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        blur: 4,
        border: const Border.fromBorderSide(BorderSide.none),
        shadowStrength: 5,
        borderRadius: BorderRadius.circular(16),
        shadowColor: Colors.white.withOpacity(0.24),
        child: content,
      ),
    );
  }
}
