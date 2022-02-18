import 'package:flutter/material.dart';

Animation<double> animateHand(AnimationController controller) {
  return Tween(
    begin: 0.0,
    end: 80.0,
  ).animate(
    CurvedAnimation(parent: controller, curve: Curves.linear),
  );
}
