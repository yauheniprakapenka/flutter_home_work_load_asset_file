import 'package:flutter/material.dart';

Animation<double> animateGirl(AnimationController controller) {
  return Tween<double>(
    begin: 0,
    end: 50,
  ).animate(
    CurvedAnimation(parent: controller, curve: Curves.linear),
  );
}
