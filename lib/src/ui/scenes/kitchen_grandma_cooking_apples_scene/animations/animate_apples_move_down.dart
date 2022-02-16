import 'package:flutter/material.dart';

Animation<double> animateApplesMoveDown(Animation<double> controller) {
  return Tween<double>(
    begin: 0,
    end: 50,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 1),
    ),
  );
}
