import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final Function onPressed;
  final Color color;
  final Widget child;
  final Color? hoverColor;
  final Color? borderColor;
  final Color? hoverBorderColor;
  final bool active;
  const HoverButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.child,
    this.hoverColor,
    this.borderColor,
    this.hoverBorderColor,
    this.active = true,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => widget.active ? setState(() => isHovering = true) : null,
      onExit: (_) => setState(() => isHovering = false),
      cursor: widget.active
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: () => widget.active ? widget.onPressed() : null,
        onTapDown: (details) {
          if (widget.active) {
            setState(() {
              isHovering = false;
            });
          }
        },
        onTapUp: (details) {
          if (widget.active) {
            setState(() {
              isHovering = true;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color:
                isHovering ? widget.hoverColor ?? widget.color : widget.color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isHovering
                  ? widget.hoverBorderColor ??
                      widget.borderColor ??
                      Colors.transparent
                  : widget.borderColor ?? Colors.transparent,
            ),
            boxShadow: isHovering
                ? const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
