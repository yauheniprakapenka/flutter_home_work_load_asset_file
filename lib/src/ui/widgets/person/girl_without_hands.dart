import 'package:flutter/material.dart';

class GirlWithoutHands extends StatelessWidget {
  final double size;

  const GirlWithoutHands({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/person/girl_without_hands.png'),
    );
  }
}
