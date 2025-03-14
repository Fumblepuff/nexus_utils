import 'package:flutter/material.dart';

class TextScaleBox extends StatelessWidget {
  final double width;
  final Text? text;
  final Widget? child;
  final Alignment alignment;
  const TextScaleBox({
    super.key,
    required this.width,
    this.text,
    this.child,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: alignment,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: text ?? child!,
        ),
      ),
    );
  }
}
