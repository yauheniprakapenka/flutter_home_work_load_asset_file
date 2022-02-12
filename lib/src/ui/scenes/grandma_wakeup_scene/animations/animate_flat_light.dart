import 'package:flutter/material.dart';

Animation<double> animateFlatLight(Animation<double> controller) {
  return Tween<double>(
    begin: 0.3,
    end: 0.0,
  ).animate(
    controller,
  );
}
