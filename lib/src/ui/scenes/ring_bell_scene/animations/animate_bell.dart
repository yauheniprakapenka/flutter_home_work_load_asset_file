import 'package:flutter/material.dart';

Animation animateBell(AnimationController controller) {
  return Tween<double>(begin: 0, end: 18).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ),
  );
}
