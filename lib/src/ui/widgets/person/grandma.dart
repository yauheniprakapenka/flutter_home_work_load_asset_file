import 'package:flutter/material.dart';

class Grandma extends StatelessWidget {
  final double size;

  const Grandma({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/person/grandma_right.png'),
    );
  }
}
