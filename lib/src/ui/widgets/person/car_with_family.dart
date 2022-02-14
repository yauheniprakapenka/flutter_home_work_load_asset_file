import 'package:flutter/material.dart';

class CarWithFamily extends StatelessWidget {
  final double size;

  const CarWithFamily({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/person/taxi_with_family.png'),
    );
  }
}
