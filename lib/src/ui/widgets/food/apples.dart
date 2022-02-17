import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Apples extends StatelessWidget {
  final double width;

  const Apples({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(context) {
    return SvgPicture.asset(
      'assets/images/food/apples.svg',
      width: width,
    );
  }
}
