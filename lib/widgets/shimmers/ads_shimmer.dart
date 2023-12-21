import 'package:flutter/material.dart';
import 'package:real_estate_app_challenge/widgets/shimmers/load_box.dart';
import 'package:shimmer/shimmer.dart';

class AdsShimmer extends StatelessWidget {
  const AdsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Colors.grey[300]!;
    Color highlightColor = Colors.grey;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: const LoadBox(height: 140, width: double.infinity),
    );
  }
}
