import 'package:flutter/material.dart';

class CatStand extends StatelessWidget {
  final double size;

  const CatStand({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/person/cat_stand.png'),
    );
  }
}
