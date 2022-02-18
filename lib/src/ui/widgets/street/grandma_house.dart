import 'package:flutter/material.dart';

class GrandmaHouse extends StatelessWidget {
  final double size;

  const GrandmaHouse({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      child: Image.asset('assets/images/city/grandma_house.png'),
    );
  }
}
