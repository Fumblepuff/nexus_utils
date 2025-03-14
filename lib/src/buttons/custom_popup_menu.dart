import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<PopupMenuItem> items;
  final String? tooltip;
  final IconData? icon;
  final double? iconSize;
  const CustomPopupMenu({
    super.key,
    required this.items,
    this.tooltip,
    this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      tooltip: tooltip,
      clipBehavior: Clip.antiAlias,
      offset: const Offset(0, 20),
      icon: Icon(
        icon ?? Icons.more_vert,
        size: iconSize ?? 20,
      ),
      constraints: const BoxConstraints(
        minWidth: 150,
      ),
      itemBuilder: (context) {
        return items;
      },
    );
  }
}
