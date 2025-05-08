import 'package:flutter/material.dart';

class FlatCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double padding;
  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;
  final Curve curve;
  const FlatCard({
    super.key,
    this.width,
    this.height,
    this.padding = 15,
    required this.child,
    this.borderColor,
    this.backgroundColor,
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: curve,
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor ?? Colors.grey.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
