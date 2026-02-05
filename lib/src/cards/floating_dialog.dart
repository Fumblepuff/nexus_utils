import 'package:flutter/material.dart';

class FloatingDialog extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;
  final double? height;
  final double? radius;
  const FloatingDialog({
    super.key,
    required this.child,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.height,
    this.radius,
  });

  @override
  State<FloatingDialog> createState() => _FloatingDialogState();
}

class _FloatingDialogState extends State<FloatingDialog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: widget.backgroundColor ?? Colors.white,
          elevation: widget.elevation ?? 1.0,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(widget.radius ?? 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.radius ?? 20)),
              border: Border.all(
                color: widget.shadowColor ?? Colors.black26,
                width: 1,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
