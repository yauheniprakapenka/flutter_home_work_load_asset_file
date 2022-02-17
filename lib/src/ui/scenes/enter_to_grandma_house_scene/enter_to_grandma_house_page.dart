import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart';

class EnterToGrandmaHousePage extends StatefulWidget {
  const EnterToGrandmaHousePage({Key? key}) : super(key: key);

  @override
  State<EnterToGrandmaHousePage> createState() => _EnterToGrandmaHousePageState();
}

class _EnterToGrandmaHousePageState extends State<EnterToGrandmaHousePage> with TickerProviderStateMixin {
  late final _umarMoveLeftCntrl = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  late final _wifeIncreaseSizeCntrl = AnimationController(duration: const Duration(milliseconds: 900), vsync: this);
  late final _wifeOpacityCntrl = AnimationController(duration: const Duration(milliseconds: 900), vsync: this);
  late final _wifeMoveLeftCntrl = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  late final _girlIncreaseSizeCntrl = AnimationController(duration: const Duration(milliseconds: 900), vsync: this);
  late final _girlOpacityCntrl = AnimationController(duration: const Duration(milliseconds: 900), vsync: this);
  late final _girlMoveLeftCntrl = AnimationController(duration: const Duration(milliseconds: 1700), vsync: this);

  static const _doorSize = 460.0;
  static const _doorTop = 250.0;

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _umarMoveLeftCntrl.dispose();
    _wifeIncreaseSizeCntrl.dispose();
    _wifeOpacityCntrl.dispose();
    _wifeMoveLeftCntrl.dispose();
    _girlIncreaseSizeCntrl.dispose();
    _girlOpacityCntrl.dispose();
    _girlMoveLeftCntrl.dispose();
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
            const Positioned(
              top: _doorTop + 50,
              right: 160,
              child: DoorOrangeOutside(
                size: _doorSize - 100,
              ),
            ),
            const Positioned(
              top: _doorTop,
              right: 100,
              child: DoorOrange(
                size: _doorSize,
              ),
            ),
            Positioned(
              top: _doorTop + 30,
              right: 300,
              child: AnimatedBuilder(
                  animation: _umarMoveLeftCntrl,
                  builder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(right: animateUmarMoveLeft(_umarMoveLeftCntrl).value),
                      child: const UmarWithPresent(
                        size: _doorSize - 50,
                      ),
                    );
                  }),
            ),
            Positioned(
              top: _doorTop + 120,
              right: 180,
              child: AnimatedBuilder(
                  animation: _girlIncreaseSizeCntrl,
                  builder: (_, __) {
                    return AnimatedBuilder(
                        animation: _girlMoveLeftCntrl,
                        builder: (_, __) {
                          return Padding(
                            padding: EdgeInsets.only(right: animateGirlMoveLeft(_girlMoveLeftCntrl).value),
                            child: Opacity(
                              opacity: animateWifeOpacity(_girlOpacityCntrl).value,
                              child: GirlWithFlower(
                                size: animateWifeIncreaseSize(_girlIncreaseSizeCntrl).value - 90,
                              ),
                            ),
                          );
                        });
                  }),
            ),
            Positioned(
              top: _doorTop + 80,
              right: 180,
              child: AnimatedBuilder(
                  animation: _wifeIncreaseSizeCntrl,
                  builder: (_, __) {
                    return AnimatedBuilder(
                        animation: _wifeMoveLeftCntrl,
                        builder: (_, __) {
                          return Padding(
                            padding: EdgeInsets.only(right: animateWifeMoveLeft(_wifeMoveLeftCntrl).value),
                            child: Opacity(
                              opacity: animateWifeOpacity(_wifeOpacityCntrl).value,
                              child: WifeWithKid(
                                size: animateWifeIncreaseSize(_wifeIncreaseSizeCntrl).value - 50,
                              ),
                            ),
                          );
                        });
                  }),
            ),
            const Positioned(
              left: 210,
              top: 420,
              child: Grandma(size: 280),
            ),
            const Positioned(
              left: 270,
              top: 358,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(346 / 360),
                child: CapBlue(size: 100),
              ),
            ),
            const Positioned(
              top: _doorTop + 350,
              right: 524,
              child: CatStand(
                size: _doorSize - 300,
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
      unawaited(_umarMoveLeftCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 500));
      unawaited(_wifeOpacityCntrl.forward().orCancel);
      unawaited(
        _wifeIncreaseSizeCntrl.forward().orCancel.then((value) async {
          unawaited(_wifeMoveLeftCntrl.forward().orCancel);
          unawaited(_girlOpacityCntrl.forward().orCancel);
          unawaited(_girlIncreaseSizeCntrl.forward().orCancel);
          await _girlMoveLeftCntrl.forward().orCancel.whenComplete(() {
            Provider.of<SceneManager>(context, listen: false).nextScene();
          });
        }),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
