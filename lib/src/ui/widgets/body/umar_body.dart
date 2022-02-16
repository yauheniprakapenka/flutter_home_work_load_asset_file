import 'package:flutter/material.dart';

class UmarBody extends StatelessWidget {
  final double size;

  const UmarBody({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      child: Image.asset('assets/images/body/body/umar_body.png'),
    );
  }
}
