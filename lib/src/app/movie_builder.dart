import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/scenes/enter_to_grandma_house_scene/enter_to_grandma_house_page.dart';

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnterToGrandmaHousePage(),
    );
  }
}
