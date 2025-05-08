import 'dart:ui';
import 'package:flutter/material.dart';
import 'gradients.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.2),
            Colors.blue.withValues(alpha: 0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(8, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          //Background Blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: Gradients.coldLinear,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey.withValues(alpha: 0.2),
                width: 1,
              ),
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
