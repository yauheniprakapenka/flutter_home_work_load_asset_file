import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../models/turn.dart';
import '../../widgets/gradients/blue_gradient.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart';

class GirlPickedUpFlowersPage extends StatefulWidget {
  const GirlPickedUpFlowersPage({Key? key}) : super(key: key);

  @override
  State<GirlPickedUpFlowersPage> createState() => _GirlPickedUpFlowerState();
}

class _GirlPickedUpFlowerState extends State<GirlPickedUpFlowersPage> with TickerProviderStateMixin {
  late final _leftHandCntrl = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  // late final _grandmaWakeUpCntrl = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
  // late final _grandmaStandUpCntrl = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
  // late final _grandmaMoveRightCntrl = AnimationController(duration: const Duration(milliseconds: 1700), vsync: this);
  // late final _windowLightOnCntrl = AnimationController(duration: Duration.zero, vsync: this);
  // late final _flatLightOnCntrl = AnimationController(duration: _lightDuration, vsync: this);

  // static const _lightDuration = Duration(milliseconds: 5000);

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    // _grandmaWakeUpCntrl.dispose();
    // _grandmaStandUpCntrl.dispose();
    // _grandmaMoveRightCntrl.dispose();
    // _windowLightOnCntrl.dispose();
    // _flatLightOnCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned.fill(
              child: BlueGradient(),
            ),
            Positioned(top: 340, left: 500, child: GirlWithoutHands(size: 300)),
            Positioned(
              top: 520,
              left: 610,
              child: AnimatedBuilder(
                  animation: _leftHandCntrl,
                  builder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(top: animateLeftHandMoveDown(_leftHandCntrl).value),
                      child: LeftHand(size: 40),
                    );
                  }),
            ),
            PlayButton(onPressed: () async {
              await _animateScene();
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {
    try {
      await _leftHandCntrl.forward().orCancel;
      // await Future.delayed(const Duration(milliseconds: 1500));
      // unawaited(_windowLightOnCntrl.forward().orCancel);
      // await Future.delayed(const Duration(milliseconds: 1000));
      // unawaited(_flatLightOnCntrl.forward().orCancel);
      // await Future.delayed(const Duration(milliseconds: 5000));
      // await _grandmaWakeUpCntrl.forward().orCancel;
      // await Future.delayed(const Duration(milliseconds: 1000));
      // await _grandmaStandUpCntrl.forward().orCancel;
      // await Future.delayed(const Duration(milliseconds: 1000));
      // await _grandmaMoveRightCntrl.forward().orCancel.whenComplete(() {
      //   Provider.of<SceneManager>(context, listen: false).nextScene();
      // });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
