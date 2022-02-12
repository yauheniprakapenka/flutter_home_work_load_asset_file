import 'package:flutter/material.dart';

Animation<double> animateJumpWithSofa(Animation<double> controller) {
  return Tween<double>(
    begin: 0.0,
    end: 220.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0),
    ),
  );
}
