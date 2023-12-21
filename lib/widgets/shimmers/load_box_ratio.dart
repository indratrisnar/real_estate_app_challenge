import 'package:flutter/material.dart';

class LoadBoxRatio extends StatelessWidget {
  const LoadBoxRatio({super.key, required this.ratio});
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.black,
        ),
      ),
    );
  }
}
