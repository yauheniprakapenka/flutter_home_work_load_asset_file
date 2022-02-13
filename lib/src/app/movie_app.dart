import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/managers/scene_manager.dart';
import '../ui/widgets/builders/movie_builder.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SceneManager(),
      child: const MaterialApp(
        home: MovieBuilder(),
      ),
    );
  }
}
