import 'package:flutter/material.dart';

Animation<Color?> animateWindowLightOn(Animation<double> controller) {
  return ColorTween(
    begin: Colors.black87,
    end: Colors.blue[300],
  ).animate(
    controller,
  );
}
