import 'package:flutter/material.dart';

Animation<double> animatePresentMoveUp(Animation<double> controller) {
  return Tween<double>(
    begin: 0,
    end: 30,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0),
    ),
  );
}
