import 'dart:async';

import 'package:flutter/material.dart';

class OnboardController {
  late AnimationController appIconAnimation;
  late Animation<Offset> appIconOffset;
  late AnimationController appTitleAnimation;
  late Animation<Offset> appTitleOffset;
  late AnimationController titleAnimation;
  late Animation<Offset> titleOffset;
  late AnimationController descriptionAnimation;
  late Animation<Offset> descriptionOffset;
  late AnimationController buttonAnimation;
  late Animation<Offset> buttonOffset;
  late AnimationController imageAnimation;
  late Animation<Offset> imageOffset;

  init({
    required TickerProvider vsync,
  }) async {
    appIconAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    appTitleAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    titleAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    descriptionAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    buttonAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    imageAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );

    Tween<Offset> tweenLeftRight = Tween(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    );
    Tween<Offset> tweenTopDown = Tween(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    );
    Tween<Offset> tweenBottomUp = Tween(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    );
    appIconOffset = tweenLeftRight.animate(appIconAnimation);
    appTitleOffset = tweenLeftRight.animate(appTitleAnimation);
    titleOffset = tweenTopDown.animate(titleAnimation);
    descriptionOffset = tweenTopDown.animate(descriptionAnimation);
    buttonOffset = tweenLeftRight.animate(buttonAnimation);
    imageOffset = tweenBottomUp.animate(imageAnimation);
  }

  execute() async {
    await Future.delayed(const Duration(milliseconds: 600));
    appIconAnimation.forward(from: 0.0);
    appTitleAnimation.forward(from: 0.0);
    await Future.delayed(const Duration(milliseconds: 300));
    titleAnimation.forward(from: 0.0);
    await Future.delayed(const Duration(milliseconds: 300));
    descriptionAnimation.forward(from: 0.0);
    await Future.delayed(const Duration(milliseconds: 300));
    buttonAnimation.forward(from: 0.0);
    await Future.delayed(const Duration(milliseconds: 300));
    imageAnimation.forward(from: 0.0);
  }

  dispose() {
    appIconAnimation.dispose();
    appTitleAnimation.dispose();
    titleAnimation.dispose();
    descriptionAnimation.dispose();
    buttonAnimation.dispose();
    imageAnimation.dispose();
  }
}
