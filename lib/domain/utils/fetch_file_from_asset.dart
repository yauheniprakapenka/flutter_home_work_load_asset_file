import 'package:flutter/services.dart';

Future<String> fetchFileFromAsset(String assetPath) async {
  return await rootBundle.loadString(assetPath).then(
        (value) => value.toString(),
      );
}
