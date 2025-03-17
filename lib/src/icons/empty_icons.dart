import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/format.dart';

class EmptyBox extends StatefulWidget {
  final IconData icon;
  final Color? iconColor;
  const EmptyBox({super.key, required this.icon, this.iconColor});

  @override
  State<EmptyBox> createState() => _EmptyBoxState();
}

class _EmptyBoxState extends State<EmptyBox> {
  bool show = false;
  @override
  void initState() {
    super.initState();
    animate();
  }

  void animate() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      show = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 115,
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: show ? Alignment.topCenter : Alignment.bottomCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: show ? 1 : 0,
              child: FaIcon(
                widget.icon,
                size: 45,
                color: widget.iconColor ?? Colors.grey,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FaIcon(
              FontAwesomeIcons.boxOpen,
              size: 65,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? textSize;
  final String? subText;
  final Color? subTextColor;
  const EmptyText({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.textSize,
    this.subText,
    this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyBox(icon: icon, iconColor: iconColor),
          const SizedBox(height: 10),
          Text(
            text,
            style: titleStyle.copyWith(
              color: textColor ?? Colors.grey,
              fontSize: textSize ?? 22,
            ),
          ),
          if (subText != null) ...[
            const SizedBox(height: 5),
            Text(
              subText!,
              style: roboto.copyWith(
                color: subTextColor ?? Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class EmptyError extends StatelessWidget {
  const EmptyError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptyBox(icon: FontAwesomeIcons.spaghettiMonsterFlying),
          const SizedBox(height: 10),
          Text(
            'Error Loading Data',
            style: titleStyle.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
