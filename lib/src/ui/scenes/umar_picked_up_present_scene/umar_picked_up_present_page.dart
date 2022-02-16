import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';
import 'animations/animate_umar_head.dart';

class UmarPickedUpPresentPage extends StatefulWidget {
  const UmarPickedUpPresentPage({Key? key}) : super(key: key);

  @override
  State<UmarPickedUpPresentPage> createState() => _GirlPickedUpFlowerState();
}

class _GirlPickedUpFlowerState extends State<UmarPickedUpPresentPage> with TickerProviderStateMixin {
  late final _umarHeadCntrl = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _umarHeadCntrl.dispose();
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
            const Positioned(top: 330, left: 540, child: UmarBody(size: 300)),
            Positioned(
              top: 220,
              left: 630,
              child: AnimatedBuilder(
                  animation: _umarHeadCntrl,
                  builder: (_, __) {
                    return RotationTransition(
                      turns: AlwaysStoppedAnimation(animateUmarHead(_umarHeadCntrl).value / 360),
                      child: const UmarHead(size: 100),
                    );
                  }),
            ),
            const Positioned(top: 340, left: 640, child: PresentYellow(size: 100)),
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      await _umarHeadCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 2000)).whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
