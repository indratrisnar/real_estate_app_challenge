import 'package:flutter/material.dart';

class DetailController {
  late AnimationController specialOfferAnimation;
  late Animation<Offset> specialOfferOffset;
  late AnimationController nameAnimation;
  late Animation<Offset> nameOffset;
  late AnimationController ratingAnimation;
  late Animation<Offset> ratingOffset;
  late AnimationController favoriteAnimation;
  late Animation<Offset> favoriteOffset;
  late AnimationController descriptionTitleAnimation;
  late Animation<Offset> descriptionTitleOffset;
  late AnimationController descriptionBodyAnimation;
  late Animation<Offset> descriptionBodyOffset;
  late AnimationController mapAnimation;
  late Animation<Offset> mapOffset;
  late AnimationController bottomActionAnimation;
  late Animation<Offset> bottomActionOffset;
  late AnimationController backButtonAnimation;
  late Animation<Offset> backButtonOffset;

  init({
    required TickerProvider vsync,
  }) async {
    specialOfferAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    nameAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    ratingAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    favoriteAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    descriptionTitleAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    descriptionBodyAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    mapAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    bottomActionAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
    backButtonAnimation = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );

    Tween<Offset> tweenBottomUp = Tween(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    );
    specialOfferOffset = tweenBottomUp.animate(specialOfferAnimation);
    nameOffset = tweenBottomUp.animate(nameAnimation);
    ratingOffset = tweenBottomUp.animate(ratingAnimation);
    favoriteOffset = tweenBottomUp.animate(favoriteAnimation);
    descriptionTitleOffset = tweenBottomUp.animate(descriptionTitleAnimation);
    descriptionBodyOffset = tweenBottomUp.animate(descriptionBodyAnimation);
    mapOffset = tweenBottomUp.animate(mapAnimation);
    bottomActionOffset = tweenBottomUp.animate(bottomActionAnimation);
    Tween<Offset> tweenLeftRight = Tween(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    );
    backButtonOffset = tweenLeftRight.animate(backButtonAnimation);
  }

  dispose() {
    specialOfferAnimation.dispose();
    nameAnimation.dispose();
    ratingAnimation.dispose();
    favoriteAnimation.dispose();
    descriptionTitleAnimation.dispose();
    descriptionBodyAnimation.dispose();
    mapAnimation.dispose();
    bottomActionAnimation.dispose();
    backButtonAnimation.dispose();
  }
}
