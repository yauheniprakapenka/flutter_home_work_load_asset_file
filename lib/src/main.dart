import 'package:flutter/material.dart';

import 'features/movie/ui/pages/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      home: const MoviePage(),
    );
  }
}
