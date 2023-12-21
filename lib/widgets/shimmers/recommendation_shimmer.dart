import 'package:flutter/material.dart';
import 'package:real_estate_app_challenge/widgets/shimmers/load_box_ratio.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationShimmer extends StatelessWidget {
  const RecommendationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Colors.grey[300]!;
    Color highlightColor = Colors.grey;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: const LoadBoxRatio(ratio: 16 / 9),
    );
  }
}
