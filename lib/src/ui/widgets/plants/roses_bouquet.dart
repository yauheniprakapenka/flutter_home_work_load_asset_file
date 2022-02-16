import 'package:flutter/material.dart';

class RosesBouquet extends StatelessWidget {
  final double size;

  const RosesBouquet({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: size,
      child: Image.asset('assets/images/plants/roses_bouquet.png'),
    );
  }
}
