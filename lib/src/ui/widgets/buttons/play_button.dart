import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const PlayButton({Key? key, required this.onPressed}) : super(key: key);

  @override 
  Widget build(context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.resolveWith((states) {
              return const Size.fromHeight(100);
            }),
            shape: MaterialStateProperty.resolveWith((states) {
              return const CircleBorder();
            }),
          ),
          onPressed: onPressed,
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
