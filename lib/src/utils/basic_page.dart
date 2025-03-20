import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicPage extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final Color? backgroundColor;
  final double? height;
  final Widget? bottomSheet;
  final BuildContext? context2;
  final PreferredSizeWidget? tabBar;
  const BasicPage({
    super.key,
    required this.title,
    required this.body,
    this.actions = const [],
    this.bottomSheet,
    this.backgroundColor,
    this.height,
    this.context2,
    this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        toolbarHeight: height,
        centerTitle: true,
        backgroundColor: backgroundColor ?? Colors.blue.shade500,
        leading: IconButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            Navigator.pop(context2 ?? context);
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: actions,
        bottom: tabBar,
      ),
      bottomSheet: bottomSheet,
      body: Background(
        child: body,
      ),
    );
  }
}
