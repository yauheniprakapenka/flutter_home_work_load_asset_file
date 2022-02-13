import 'package:flutter/material.dart';

Animation<double> animateWifeIncreaseSize(Animation<double> controller) {
  return Tween<double>(
    begin: 360.0,
    end: 420.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0),
    ),
  );
}
