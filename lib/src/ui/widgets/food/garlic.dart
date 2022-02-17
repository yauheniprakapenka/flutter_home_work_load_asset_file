import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Garlic extends StatelessWidget {
  final double width;

  const Garlic({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(context) {
    return SvgPicture.asset(
      'assets/images/food/garlic.svg',
      width: width,
    );
  }
}
