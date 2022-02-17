import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatWithoutTail extends StatelessWidget {
  final double size;

  const CatWithoutTail({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      child: SvgPicture.asset(
        'assets/images/person/cat_without_tail.svg',
        width: size,
      ),
    );
  }
}
