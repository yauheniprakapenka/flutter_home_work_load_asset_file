import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final double size;

  const Cloud({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      child: Image.asset('assets/images/city/cloud.png'),
    );
  }
}
