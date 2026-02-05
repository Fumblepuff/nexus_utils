import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FloatingModal extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? elevation;
  const FloatingModal({
    super.key,
    required this.child,
    this.backgroundColor,
    this.elevation,
  });

  @override
  State<FloatingModal> createState() => _FloatingModalState();
}

class _FloatingModalState extends State<FloatingModal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          color: widget.backgroundColor ?? Colors.white,
          elevation: widget.elevation ?? 1.0,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(20),
          child: widget.child,
        ),
      ),
    );
  }
}

void showFloatingModal(BuildContext context, FloatingModal widget) {
  showCustomModalBottomSheet(
    context: context,
    builder: (context) => widget.child,
    containerWidget: (context, animation, child) => FloatingModal(
      child: child,
    ),
    expand: false,
  );
}
