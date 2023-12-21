import 'package:flutter/material.dart';
import 'package:real_estate_app_challenge/widgets/shimmers/load_box_ratio.dart';
import 'package:shimmer/shimmer.dart';

class PopularShimmer extends StatelessWidget {
  const PopularShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Colors.grey[300]!;
    Color highlightColor = Colors.grey;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 16 : 8,
              bottom: index == 1 ? 0 : 8,
            ),
            child: const LoadBoxRatio(ratio: 16 / 9),
          );
        },
      ),
    );
  }
}
