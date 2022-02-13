import 'package:flutter/material.dart';

Animation<double> animateFlatLightOn(Animation<double> controller) {
  return Tween<double>(
    begin: 0.9,
    end: 0.0,
  ).animate(
    controller,
  );
}
