import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart' as animation;

class KitchenGrandmaCookingRisPage extends StatefulWidget {
  const KitchenGrandmaCookingRisPage({Key? key}) : super(key: key);

  @override
  State<KitchenGrandmaCookingRisPage> createState() => _KitchenGrandmaCookingRisPageState();
}

class _KitchenGrandmaCookingRisPageState extends State<KitchenGrandmaCookingRisPage> with TickerProviderStateMixin {
  late final _grandmadMoveRightCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveRightDuration));
  late final _risMoveRightCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveRightDuration));
  late final _grandmaMoveDownCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveDownDuration));
  late final _risMoveDownCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _moveDownDuration));
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
    _risMoveRightCntrl.dispose();
    _grandmaMoveDownCntrl.dispose();
    _risMoveDownCntrl.dispose();
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
              left: 400,
              child: AnimatedBuilder(
                animation: _grandmadMoveRightCntrl,
                builder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.only(left: animation.animateGrandmaMoveRight(_grandmadMoveRightCntrl).value),
                    child: AnimatedBuilder(
                      animation: _grandmaMoveDownCntrl,
                      builder: (_, __) {
                        return RotationTransition(
                          turns: AlwaysStoppedAnimation(animation.animateGrandmaMoveDown(_grandmaMoveDownCntrl).value / 360),
                          child: const Grandma(size: 220),
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
              left: 500,
              child: Builder(builder: (context) {
                return AnimatedBuilder(
                    animation: _risMoveRightCntrl,
                    builder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.only(left: animation.animateGrandmaMoveRight(_risMoveRightCntrl).value),
                        child: AnimatedBuilder(
                            animation: _risMoveDownCntrl,
                            builder: (_, __) {
                              return Padding(
                                padding: EdgeInsets.only(top: animation.animateRisMoveDown(_risMoveDownCntrl).value),
                                child: const Ris(width: 120),
                              );
                            }),
                      );
                    });
              }),
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
      unawaited(_risMoveRightCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 2000));
      unawaited(_grandmaMoveDownCntrl.forward().orCancel);
      await _risMoveDownCntrl.forward().orCancel.whenComplete(() async {
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
