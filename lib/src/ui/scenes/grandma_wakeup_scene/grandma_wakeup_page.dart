import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../models/turn.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart';

class GrandmaWakeUpPage extends StatefulWidget {
  const GrandmaWakeUpPage({Key? key}) : super(key: key);

  @override
  State<GrandmaWakeUpPage> createState() => _GrandmaWakeUpPageState();
}

class _GrandmaWakeUpPageState extends State<GrandmaWakeUpPage> with TickerProviderStateMixin {
  late final _grandmaWakeUpCntrl = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
  late final _grandmaStandUpCntrl = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
  late final _grandmaMoveRightCntrl = AnimationController(duration: const Duration(milliseconds: 1700), vsync: this);
  late final _windowLightOnCntrl = AnimationController(duration: Duration.zero, vsync: this);
  late final _flatLightOnCntrl = AnimationController(duration: _lightDuration, vsync: this);

  static const _lightDuration = Duration(milliseconds: 5000);

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _grandmaWakeUpCntrl.dispose();
    _grandmaStandUpCntrl.dispose();
    _grandmaMoveRightCntrl.dispose();
    _windowLightOnCntrl.dispose();
    _flatLightOnCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned.fill(
              child: OrangeGradient(),
            ),
            AnimatedBuilder(
              animation: _flatLightOnCntrl,
              builder: (_, __) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.black.withOpacity(animateFlatLightOn(_flatLightOnCntrl).value),
                );
              },
            ),
            Positioned(
              top: 270,
              left: 340,
              child: AnimatedBuilder(
                animation: _windowLightOnCntrl,
                builder: (_, __) {
                  return AnimatedContainer(
                    width: 200,
                    height: 180,
                    color: animateWindowLightOn(_windowLightOnCntrl).value,
                    duration: _lightDuration,
                  );
                },
              ),
            ),
            const Positioned(
              left: 320,
              top: 130,
              child: SofaWindowLamp(size: 600),
            ),
            Positioned(
              left: 510,
              top: 340,
              child: RotationTransition(
                turns: animateGrandmaWakeup(_grandmaWakeUpCntrl, Turn.turn90),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: AnimatedBuilder(
                    animation: _grandmaStandUpCntrl,
                    builder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.only(top: animateGrandmaStandUp(_grandmaStandUpCntrl).value),
                        child: AnimatedBuilder(
                          animation: _grandmaMoveRightCntrl,
                          builder: (_, __) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: animateGrandmaMoveRight(_grandmaMoveRightCntrl).value,
                                left: animateGrandmaMoveRight(_grandmaMoveRightCntrl).value,
                              ),
                              child: const Grandma(size: 240),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
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
      await Future.delayed(const Duration(milliseconds: 1500));
      unawaited(_windowLightOnCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 1000));
      unawaited(_flatLightOnCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 5000));
      await _grandmaWakeUpCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 1000));
      await _grandmaStandUpCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 1000));
      await _grandmaMoveRightCntrl.forward().orCancel.whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
