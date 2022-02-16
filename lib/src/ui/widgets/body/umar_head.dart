import 'package:flutter/material.dart';

class UmarHead extends StatelessWidget {
  final double size;

  const UmarHead({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      child: Image.asset('assets/images/body/head/umar_head.png'),
    );
  }
}
