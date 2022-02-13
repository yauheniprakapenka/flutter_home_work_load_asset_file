import 'package:flutter/material.dart';

class CapBlue extends StatelessWidget {
  final double size;

  const CapBlue({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/clothes/cap_blue.png'),
    );
  }
}
