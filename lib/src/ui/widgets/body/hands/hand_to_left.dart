import 'package:flutter/material.dart';

class HandToLeft extends StatelessWidget {
  final double size;

  const HandToLeft({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      child: Image.asset('assets/images/body/hands/hand_to_left.png'),
    );
  }
}
