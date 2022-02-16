import 'package:flutter/material.dart';

import '../scenes/enter_to_grandma_house_scene/enter_to_grandma_house_page.dart';
import '../scenes/family_driving_car_scene/family_driving_car_page.dart';
import '../scenes/girl_picked_up_flowers_scene/girl_picked_up_flowers_page.dart';
import '../scenes/grandma_wakeup_scene/grandma_wakeup_page.dart';
import '../scenes/umar_picked_up_present_scene/umar_picked_up_present_page.dart';

class SceneManager extends ChangeNotifier {
  static const _scenes = <Widget>[
    GrandmaWakeUpPage(),
    GirlPickedUpFlowersPage(),
    UmarPickedUpPresentPage(),
    FamilyDrivingCarPage(),
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
