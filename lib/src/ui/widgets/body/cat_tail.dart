import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatTail extends StatelessWidget {
  final double size;

  const CatTail({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      child: SvgPicture.asset(
        'assets/images/body/tail/tail_cat.svg',
        width: size,
      ),
    );
  }
}
