import 'package:flutter/material.dart';

Animation<double> animateCatTailMoving(AnimationController controller) {
  return Tween<double>(
    begin: 1,
    end: 1.1,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0),
    ),
  );
}
