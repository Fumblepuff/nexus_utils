import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/text_format.dart';
import '../buttons/info_tooltip.dart';

class WindowHeader extends StatelessWidget {
  final String title;
  final bool showInfo;
  final String? infoText;
  const WindowHeader({
    super.key,
    required this.title,
    this.showInfo = false,
    this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: titleStyle,
                ),
              ),
              if (showInfo) ...[
                const SizedBox(width: 10),
                InfoTooltipButton(infoText: infoText!),
              ],
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            tooltip: 'Close',
            hoverColor: Colors.red[100],
            icon: const Icon(
              FontAwesomeIcons.xmark,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
