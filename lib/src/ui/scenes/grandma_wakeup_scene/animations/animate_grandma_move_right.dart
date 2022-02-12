import 'package:flutter/material.dart';

Animation<double> animateGrandmaMoveRight(Animation<double> controller) {
  return Tween<double>(
    begin: 0.0,
    end: 360.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0),
    ),
  );
}
