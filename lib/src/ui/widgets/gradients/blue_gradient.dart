import 'package:flutter/material.dart';

class BlueGradient extends StatelessWidget {
  const BlueGradient({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Image.asset(
      'assets/images/gradients/blue_gradient.png',
      fit: BoxFit.fill,
    );
  }
}
