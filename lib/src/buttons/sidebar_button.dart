import 'package:flutter/material.dart';

import '../utils/text_scale_box.dart';

class SidebarButton extends StatefulWidget {
  final Function() onTap;
  final String label;
  final IconData icon;
  final bool isSelected;
  final bool hasNotification;
  final Color? selectColor;
  final Color? hoverColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? hoverTextColor;
  final Color? hoverIconColor;
  const SidebarButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.isSelected,
    this.hasNotification = false,
    this.selectColor = Colors.lightBlue,
    this.hoverColor = Colors.blue,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.hoverTextColor = Colors.white,
    this.hoverIconColor = Colors.white,
  });

  @override
  State<SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hover = true;
          });
        },
        onExit: (_) {
          setState(() {
            hover = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.125,
            height: 60,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.125,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? widget.selectColor
                        : hover
                            ? widget.hoverColor!.withValues(alpha: 0.5)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextScaleBox(
                        width: MediaQuery.of(context).size.width * 0.075,
                        child: Text(
                          widget.label,
                          style: TextStyle(
                            color: widget.isSelected
                                ? widget.textColor
                                : hover
                                    ? widget.hoverTextColor
                                    : widget.textColor,
                            fontWeight: widget.isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      Icon(
                        widget.icon,
                        size: 20,
                        color: widget.isSelected
                            ? widget.iconColor
                            : hover
                                ? widget.hoverIconColor
                                : widget.iconColor,
                      ),
                    ],
                  ),
                ),
                if (widget.hasNotification)
                  Positioned(
                    right: 2.5,
                    top: 2.5,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
