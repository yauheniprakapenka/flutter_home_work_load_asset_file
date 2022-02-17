import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart' as animation;

class KitchenGrandmaCookingApplesPage extends StatefulWidget {
  const KitchenGrandmaCookingApplesPage({Key? key}) : super(key: key);

  @override
  State<KitchenGrandmaCookingApplesPage> createState() => _KitchenGrandmaCookingApplesPageState();
}

class _KitchenGrandmaCookingApplesPageState extends State<KitchenGrandmaCookingApplesPage> with TickerProviderStateMixin {
  late final _grandmadMoveRightCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveRightDuration));
  late final _applesMoveRightCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveRightDuration));
  late final _grandmaMoveDownCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveDownDuration));
  late final _applesMoveDownCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveDownDuration));
  static const _moveRightDuration = 1400;
  static const _moveDownDuration = 600;

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _grandmadMoveRightCntrl.dispose();
    _applesMoveRightCntrl.dispose();
    _grandmaMoveDownCntrl.dispose();
    _applesMoveDownCntrl.dispose();
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
            Positioned(
              top: 380,
              right: 200,
              child: AnimatedBuilder(
                animation: _grandmadMoveRightCntrl,
                builder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.only(right: animation.animateGrandmaMoveRight(_grandmadMoveRightCntrl).value),
                    child: AnimatedBuilder(
                      animation: _grandmaMoveDownCntrl,
                      builder: (_, __) {
                        return RotationTransition(
                          turns: AlwaysStoppedAnimation(animation.animateGrandmaMoveDown(_grandmaMoveDownCntrl).value / 360),
                          child: Transform(transform: Matrix4.rotationY(1800), child: const Grandma(size: 220)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(top: 140.0),
                child: Center(child: KitchenTable()),
              ),
            ),
            Positioned(
              top: 450,
              right: 520,
              child: Builder(builder: (context) {
                return AnimatedBuilder(
                    animation: _applesMoveRightCntrl,
                    builder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.only(right: animation.animateGrandmaMoveRight(_applesMoveRightCntrl).value),
                        child: AnimatedBuilder(
                            animation: _applesMoveDownCntrl,
                            builder: (_, __) {
                              return Padding(
                                padding: EdgeInsets.only(top: animation.animateApplesMoveDown(_applesMoveDownCntrl).value),
                                child: const Apples(width: 100),
                              );
                            }),
                      );
                    });
              }),
            ),
            const Positioned(
              top: 450,
              left: 500,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 200),
                child: Ris(width: 120),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      unawaited(_grandmadMoveRightCntrl.forward().orCancel);
      unawaited(_applesMoveRightCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 2000));
      unawaited(_grandmaMoveDownCntrl.forward().orCancel);
      await _applesMoveDownCntrl.forward().orCancel.whenComplete(() async {
        await Future.delayed(const Duration(milliseconds: 400));
        await _grandmaMoveDownCntrl.reverse();
      });
      await Future.delayed(const Duration(milliseconds: 1000)).whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
