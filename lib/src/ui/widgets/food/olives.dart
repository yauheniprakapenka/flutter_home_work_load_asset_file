import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Olives extends StatelessWidget {
  final double width;

  const Olives({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(context) {
    return SvgPicture.asset(
      'assets/images/food/olives.svg',
      width: width,
    );
  }
}
