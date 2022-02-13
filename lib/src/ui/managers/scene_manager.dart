import 'package:flutter/material.dart';

import '../scenes/enter_to_grandma_house_scene/enter_to_grandma_house_page.dart';
import '../scenes/grandma_wakeup_scene/grandma_wakeup_page.dart';

class SceneManager extends ChangeNotifier {
  static const _scenes = <Widget>[
    GrandmaWakeUpPage(),
    EnterToGrandmaHousePage(),
  ];

  var _currentSceneIndex = 0;

  Widget get getScene {
    return _scenes[_currentSceneIndex];
  }

  void nextScene() {
    _currentSceneIndex++;
    if (_scenes.length <= _currentSceneIndex) return;
    notifyListeners();
  }
}
