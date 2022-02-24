import 'package:flutter/material.dart';

Animation<double> animateGrandmaMoveLeft(Animation<double> controller) {
  return Tween<double>(
    begin: 0,
    end: 200,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 1),
    ),
  );
}
