import 'package:flutter/material.dart';
import 'package:skillbox_load_file/presentation/core/style/app_border_radius.dart';

class AppBorderSide {
  static final outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 2),
    borderRadius: BorderRadius.only(
      topLeft: AppRadius.circular,
      bottomLeft: AppRadius.circular,
    ),
  );
}
