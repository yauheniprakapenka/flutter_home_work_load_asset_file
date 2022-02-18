import 'package:flutter/material.dart';

class RingBell extends StatelessWidget {
  final double size;

  const RingBell({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      children: [
        Container(height: size, width: size * 0.25, color: Colors.grey[300]),
        Container(height: size * 0.5, width: size * 0.2, color: Colors.grey[600]),
      ],
    );
  }
}
