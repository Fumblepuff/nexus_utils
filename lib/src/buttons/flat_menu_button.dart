import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cards/card_flat.dart';

class FlatMenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  final double? width;
  final double? height;
  final Widget? trailing;
  final Color? backgroundColor;
  final IconData? endIcon;
  final Color? textColor;
  final double spacing;
  const FlatMenuButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.width,
    this.height,
    this.trailing,
    this.backgroundColor,
    this.endIcon,
    this.textColor = Colors.black,
    this.spacing = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: FlatCard(
          width: width ?? MediaQuery.of(context).size.width * 0.85,
          height: height,
          backgroundColor: backgroundColor,
          child: Row(
            children: [
              FaIcon(
                icon,
                size: 20,
                color: textColor,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textScaler: TextScaler.noScaling,
              ),
              const Spacer(),
              if (trailing != null) ...[
                trailing!,
                const SizedBox(width: 5),
              ],
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FaIcon(
                  endIcon ?? FontAwesomeIcons.chevronRight,
                  size: 20,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
