import 'package:flutter/material.dart';
import 'package:skillbox_load_file/presentation/core/style/app_border_radius.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomTextButton({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: SizedBox(
        width: 64,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: AppRadius.circular,
                bottomRight: AppRadius.circular,
              ),
            );
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
    );
  }
}
