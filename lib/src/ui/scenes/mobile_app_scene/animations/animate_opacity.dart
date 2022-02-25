import 'package:flutter/material.dart';

Animation<double> animateOpacity(AnimationController controller) {
  return Tween<double>(begin: 1, end: 0).animate(controller);
}
