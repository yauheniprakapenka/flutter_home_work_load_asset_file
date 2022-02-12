import 'package:flutter/material.dart';

Animation<Color?> animateOutsideWindowLight(Animation<double> controller) {
  return ColorTween(
    begin: Colors.black54,
    end: Colors.blue[300],
  ).animate(
    controller,
  );
}
