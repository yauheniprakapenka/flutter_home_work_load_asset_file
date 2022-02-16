import 'package:flutter/material.dart';

class RightHand extends StatelessWidget {
  final double size;

  const RightHand({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/body/hands/right_hand.png'),
    );
  }
}
