import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double padding;
  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;
  const WhiteCard({
    super.key,
    this.width,
    this.height,
    this.padding = 10,
    required this.child,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
