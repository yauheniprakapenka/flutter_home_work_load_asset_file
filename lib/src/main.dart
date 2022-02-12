import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/scenes/grandma_wakeup_scene/grandma_wakeup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GrandmaWakeUpPage(),
    );
  }
}
