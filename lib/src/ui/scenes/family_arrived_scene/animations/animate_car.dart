import 'package:flutter/material.dart';

Animation<double> animateCar(AnimationController controller) {
  return Tween<double>(begin: 0, end: 800).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
}
