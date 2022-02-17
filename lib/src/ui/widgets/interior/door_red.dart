import 'package:flutter/material.dart';

class DoorRed extends StatelessWidget {
  final double width;

  const DoorRed({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: width,
      child: Image.asset(
        'assets/images/interior/door_red.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
