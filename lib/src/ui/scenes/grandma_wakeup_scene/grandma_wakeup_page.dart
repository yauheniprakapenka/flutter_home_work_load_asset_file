import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/turn.dart';
import '../../scenes/grandma_wakeup_scene/animations/animate_grandma_wakeup.dart';
import '../../scenes/grandma_wakeup_scene/animations/animate_jump_with_sofa.dart';
import '../../widgets/widgets.dart';
import 'animations/animate_flat_light.dart';
import 'animations/animate_grandma_move_right.dart';
import 'animations/animate_outside_window_light.dart';

class GrandmaWakeUpPage extends StatefulWidget {
  const GrandmaWakeUpPage({Key? key}) : super(key: key);

  @override
  State<GrandmaWakeUpPage> createState() => _GrandmaWakeUpPageState();
}

class _GrandmaWakeUpPageState extends State<GrandmaWakeUpPage> with TickerProviderStateMixin {
  late final _grandmaWakeupCntrl = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
  late final _grandmaJumoWithSofaCntrl = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
  late final _grandmaMoveRightCntrl = AnimationController(duration: const Duration(milliseconds: 1700), vsync: this);
  late final _oursideWindowLightCntrl = AnimationController(duration: Duration.zero, vsync: this);
  late final _flatLightCntrl = AnimationController(duration: _lightDuration, vsync: this);

  static const _lightDuration = Duration(milliseconds: 3000);

  @override
  void dispose() {
    _grandmaJumoWithSofaCntrl.dispose();
    _grandmaWakeupCntrl.dispose();
    _grandmaMoveRightCntrl.dispose();
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
              animation: _flatLightCntrl,
              builder: (_, __) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.black.withOpacity(animateFlatLight(_flatLightCntrl).value),
                );
              },
            ),
            Positioned(
              top: 270,
              left: 340,
              child: AnimatedBuilder(
                animation: _oursideWindowLightCntrl,
                builder: (_, __) {
                  return AnimatedContainer(
                    width: 200,
                    height: 180,
                    color: animateOutsideWindowLight(_oursideWindowLightCntrl).value,
                    duration: _lightDuration,
                  );
                },
              ),
            ),
            Positioned(
              left: 400,
              bottom: 0,
              child: ElevatedButton(
                child: const Text('Start'),
                onPressed: () async {
                  await _animateScene();
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
                turns: animateGrandmaWakeup(_grandmaWakeupCntrl, Turn.turn90),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: AnimatedBuilder(
                    animation: _grandmaJumoWithSofaCntrl,
                    builder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.only(top: animateJumpWithSofa(_grandmaJumoWithSofaCntrl).value),
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
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {
    try {
      unawaited(_oursideWindowLightCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 1000));
      unawaited(_flatLightCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 5000));
      await _grandmaWakeupCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 1000));
      await _grandmaJumoWithSofaCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 1000));
      await _grandmaMoveRightCntrl.forward().orCancel;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
