import 'package:flutter/material.dart';

class HomeController {
  late AnimationController adsAnimation;
  late AnimationController recommendationAnimation;
  late AnimationController popularAnimation;

  init({
    required TickerProvider vsync,
  }) async {
    adsAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 2000),
    );
    recommendationAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 2000),
    );
    popularAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 2000),
    );
  }

  reset() {
    adsAnimation.value = 0.0;
    recommendationAnimation.value = 0.0;
    popularAnimation.value = 0.0;
  }

  execute() {
    reset();
    adsAnimation.forward(from: 0.0);
    recommendationAnimation.forward(from: 0.0);
    popularAnimation.forward(from: 0.0);
  }

  dispose() {
    adsAnimation.dispose();
    recommendationAnimation.dispose();
    popularAnimation.dispose();
  }
}
