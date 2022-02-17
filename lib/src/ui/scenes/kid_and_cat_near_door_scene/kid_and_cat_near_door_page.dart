import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'animations/animations.dart' as animations;

class KidAndCatNearDoorPage extends StatefulWidget {
  const KidAndCatNearDoorPage({Key? key}) : super(key: key);

  @override
  State<KidAndCatNearDoorPage> createState() => _KidAndCatNearDoorPageState();
}

class _KidAndCatNearDoorPageState extends State<KidAndCatNearDoorPage> with TickerProviderStateMixin {
  late final _catTailMovingCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _catTailDuration));
  late final _catTailMoveUpDownCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: _catTailDuration));

  static const _catTailDuration = 500;

  @override
  void initState() {
    super.initState();
    // _animateScene();
  }

  @override
  void dispose() {
    _catTailMovingCntrl.dispose();
    _catTailMoveUpDownCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/gradients/blue_gradient.png', fit: BoxFit.cover),
            ),
            const Positioned(top: 280, right: 260, child: DoorRed(width: 380)),
            Positioned(
              right: 120,
              bottom: 200,
              child: AnimatedBuilder(
                animation: _catTailMoveUpDownCntrl,
                builder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: animations.animateCatTailMoveUpDown(_catTailMoveUpDownCntrl).value),
                    child: AnimatedBuilder(
                      animation: _catTailMovingCntrl,
                      builder: (_, __) {
                        return Transform.rotate(
                          angle: pi / animations.animateCatTailMoving(_catTailMovingCntrl).value,
                          child: const CatTail(size: 100),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const Positioned(right: 200, top: 740, child: CatWithoutTail(size: 140)),
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    var tailCounter = 0;
    try {
      while (tailCounter < 50) {
        tailCounter++;
        unawaited(_catTailMoveUpDownCntrl.forward().orCancel);
        await _catTailMovingCntrl.forward().orCancel;
        unawaited(_catTailMoveUpDownCntrl.reverse().orCancel);
        await _catTailMovingCntrl.reverse().orCancel;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
