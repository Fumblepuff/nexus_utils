import 'package:flutter/material.dart';

class PaddedGrabBar extends StatelessWidget {
  final double padding;
  const PaddedGrabBar({super.key, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Center(
        child: Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
