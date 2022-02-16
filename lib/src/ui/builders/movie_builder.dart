import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../managers/scene_manager.dart';

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SceneManager>(builder: (context, value, child) {
        return context.watch<SceneManager>().getScene;
      }),
    );
  }
}
