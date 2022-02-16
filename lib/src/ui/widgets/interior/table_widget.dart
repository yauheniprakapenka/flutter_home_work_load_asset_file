import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  final double width;

  const TableWidget({Key? key, required this.width}) : super(key: key);

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
