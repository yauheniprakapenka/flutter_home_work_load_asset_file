import 'package:flutter/material.dart';

class GirlWithFlower extends StatelessWidget {
  final double size;

  const GirlWithFlower({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/person/girl_with_flower.png'),
    );
  }
}
