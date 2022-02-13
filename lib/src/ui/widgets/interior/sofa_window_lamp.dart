import 'package:flutter/material.dart';

class SofaWindowLamp extends StatelessWidget {
  final double size;

  const SofaWindowLamp({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/interior/sofa_window_lamp.png'),
    );
  }
}
