import 'package:flutter/material.dart';

class WifeWithKid extends StatelessWidget {
  final double size;

  const WifeWithKid({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/person/wife_with_kid.png'),
    );
  }
}
