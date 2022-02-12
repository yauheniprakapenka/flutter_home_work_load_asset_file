import 'package:flutter/material.dart';

class OrangeGradient extends StatelessWidget {
  const OrangeGradient({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Image.asset(
      'assets/images/gradients/orange_gradient.png',
      fit: BoxFit.fill,
    );
  }
}
