import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/format.dart';

class InfoTooltipButton extends StatelessWidget {
  final String infoText;
  const InfoTooltipButton({super.key, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.help,
      child: Tooltip(
        triggerMode: TooltipTriggerMode.tap,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        showDuration: const Duration(seconds: 4),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        message: infoText,
        textStyle: roboto.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        child: const FaIcon(
          FontAwesomeIcons.circleQuestion,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
