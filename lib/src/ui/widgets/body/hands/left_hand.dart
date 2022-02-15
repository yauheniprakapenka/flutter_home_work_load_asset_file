import 'package:flutter/material.dart';

class LeftHand extends StatelessWidget {
  final double size;

  const LeftHand({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/body/hands/left_hand.png'),
    );
  }
}
