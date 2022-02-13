import 'package:flutter/material.dart';

import '../../../models/turn.dart';

Animation<double> animateGrandmaWakeup(Animation<double> controller, Turn turn) {
  return Tween<double>(
    begin: 0.0,
    end: turn.getValue(),
  ).animate(
    controller,
  );
}
