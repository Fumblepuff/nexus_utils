import 'package:flutter/material.dart';
import '../utils/format.dart';

class CustomTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  const CustomTooltip({super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      waitDuration: const Duration(milliseconds: 500),
      showDuration: const Duration(seconds: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(20),
      ),
      textStyle: roboto.copyWith(
        color: Colors.white,
        fontSize: 12,
      ),
      child: child,
    );
  }
}
