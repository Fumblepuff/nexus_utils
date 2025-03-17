import 'package:flutter/material.dart';
import '../utils/format.dart';
import 'package:shimmer/shimmer.dart';

class IconLoadingShimmer extends StatelessWidget {
  final IconData icon;
  final String? text;
  const IconLoadingShimmer({super.key, required this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            Text(
              text ?? 'Loading...',
              style: roboto,
            ),
          ],
        ),
      ),
    );
  }
}
