import 'package:flutter/material.dart';
import 'format.dart';

class CustomTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final double? indicatorWeight;
  final TabBarIndicatorSize? indicatorSize;
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorSize,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: widget.labelColor ?? Colors.black,
      unselectedLabelColor: widget.unselectedLabelColor ?? Colors.grey,
      indicatorColor: widget.indicatorColor ?? Colors.black.withOpacity(0.5),
      indicatorWeight: widget.indicatorWeight ?? 3,
      indicatorSize: widget.indicatorSize ?? TabBarIndicatorSize.label,
      splashBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      enableFeedback: true,
      labelStyle: roboto,
      tabs: widget.tabs,
    );
  }
}
