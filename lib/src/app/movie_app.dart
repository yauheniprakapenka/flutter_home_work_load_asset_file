import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/builders/movie_builder.dart';
import '../ui/managers/scene_manager.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SceneManager(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MovieBuilder(),
      ),
    );
  }
}
