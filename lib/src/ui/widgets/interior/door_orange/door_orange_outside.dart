import 'package:flutter/material.dart';

class DoorOrangeOutside extends StatelessWidget {
  final double size;

  const DoorOrangeOutside({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/interior/door_orange/door_orange_outside.png'),
    );
  }
}
