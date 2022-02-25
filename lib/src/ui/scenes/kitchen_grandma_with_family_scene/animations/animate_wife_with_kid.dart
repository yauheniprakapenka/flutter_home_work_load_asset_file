import 'package:flutter/material.dart';

Animation<double> animateWifeWithKid(AnimationController controller) {
  return Tween<double>(
    begin: 50,
    end: 0,
  ).animate(
    CurvedAnimation(parent: controller, curve: Curves.linear),
  );
}
