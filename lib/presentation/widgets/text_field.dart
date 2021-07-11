import 'package:flutter/material.dart';
import 'package:skillbox_load_file/presentation/core/style/app_border_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  CustomTextField({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: AppBorderSide.outlineInputBorder,
        enabledBorder: AppBorderSide.outlineInputBorder,
      ),
    );
  }
}
