import 'package:flutter/material.dart';

class GirlTable extends StatelessWidget {
  final double width;

  const GirlTable({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      width: width,
      child: Image.asset(
        'assets/images/interior/table.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
