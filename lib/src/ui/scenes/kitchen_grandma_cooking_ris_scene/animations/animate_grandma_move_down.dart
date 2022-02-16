import 'package:flutter/material.dart';

Animation<double> animateGrandmaMoveDown(Animation<double> controller) {
  return Tween<double>(begin: 0, end: 20).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 1),
    ),
  );
}
