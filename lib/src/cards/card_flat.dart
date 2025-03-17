import 'package:flutter/material.dart';

class FlatCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double padding;
  final Widget child;
  final Color? borderColor;
  final Curve curve;
  const FlatCard({
    super.key,
    this.width,
    this.height,
    this.padding = 15,
    required this.child,
    this.borderColor,
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
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor ?? Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
