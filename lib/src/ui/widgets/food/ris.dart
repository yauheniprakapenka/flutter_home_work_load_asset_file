import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Ris extends StatelessWidget {
  final double width;

  const Ris({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(context) {
    return SvgPicture.asset(
      'assets/icons/food/ris.svg',
      width: width,
    );
  }
}
