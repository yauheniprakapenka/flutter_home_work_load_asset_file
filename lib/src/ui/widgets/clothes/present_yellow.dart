import 'package:flutter/material.dart';

class PresentYellow extends StatelessWidget {
  final double size;

  const PresentYellow({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      child: Image.asset('assets/images/clothes/present_yellow.png'),
    );
  }
}
