import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/body/hands/right_hand.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart';

class GirlPickedUpFlowersPage extends StatefulWidget {
  const GirlPickedUpFlowersPage({Key? key}) : super(key: key);

  @override
  State<GirlPickedUpFlowersPage> createState() => _GirlPickedUpFlowerState();
}

class _GirlPickedUpFlowerState extends State<GirlPickedUpFlowersPage> with TickerProviderStateMixin {
  late final _leftHandCntrl = AnimationController(duration: const Duration(milliseconds: _moveHandDownDuration), vsync: this);
  late final _rightHandCntrl = AnimationController(duration: const Duration(milliseconds: _moveHandDownDuration), vsync: this);
  late final _presentCntrl = AnimationController(duration: const Duration(milliseconds: _moveHandDownDuration), vsync: this);

  static const _moveHandDownDuration = 900;

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _leftHandCntrl.dispose();
    _rightHandCntrl.dispose();
    _presentCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Positioned.fill(child: ColoredBox(color: Colors.lime[300] ?? Colors.white)),
            ),
            const Positioned(top: 370, left: 500, child: GirlWithoutHands(size: 300)),
            const Positioned(top: 620, left: 420, child: TableWidget(width: 500)),
            Positioned(
              bottom: 370,
              left: 610,
              child: AnimatedBuilder(
                  animation: _presentCntrl,
                  builder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: animatePresentMoveUp(_presentCntrl).value),
                      child: const RosesBouquet(size: 100),
                    );
                  }),
            ),
            Positioned(
              top: 555,
              left: 610,
              child: AnimatedBuilder(
                  animation: _leftHandCntrl,
                  builder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(top: animateLeftHandMoveDown(_leftHandCntrl).value),
                      child: const LeftHand(size: 40),
                    );
                  }),
            ),
            Positioned(
              top: 555,
              left: 674,
              child: AnimatedBuilder(
                  animation: _rightHandCntrl,
                  builder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(top: animateRightHandMoveDown(_leftHandCntrl).value),
                      child: const RightHand(size: 40),
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
      await Future.delayed(const Duration(milliseconds: 1000));
      unawaited(_leftHandCntrl.forward().orCancel);
      unawaited(_rightHandCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: _moveHandDownDuration + 900));
      unawaited(_leftHandCntrl.reverse().orCancel);
      unawaited(_rightHandCntrl.reverse().orCancel);
      unawaited(_presentCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 2000)).whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
