import 'package:flutter/material.dart';

class DoorOrange extends StatelessWidget {
  final double size;

  const DoorOrange({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/interior/door_orange/door_orange.png'),
    );
  }
}
