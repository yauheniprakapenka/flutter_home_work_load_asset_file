import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';
import 'animations/animations.dart' as animations;

class RingBellPage extends StatefulWidget {
  const RingBellPage({Key? key}) : super(key: key);

  @override
  State<RingBellPage> createState() => _RingBellPagePageState();
}

class _RingBellPagePageState extends State<RingBellPage> with TickerProviderStateMixin {
  late final _handCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  late final _bellCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _handCntrl.dispose();
    _bellCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned.fill(
              child: ColoredBox(color: Colors.white),
            ),
            Positioned(
              child: Container(width: 850, color: Colors.grey[100] ?? Colors.white),
            ),
            Positioned(
              top: 450,
              right: -100,
              child: AnimatedBuilder(
                animation: _handCntrl,
                builder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.only(right: animations.animateHand(_handCntrl).value),
                    child: const HandToLeft(size: 500),
                  );
                },
              ),
            ),
            Positioned(
              top: 450,
              right: 450,
              child: AnimatedBuilder(
                animation: _bellCntrl,
                builder: (_, __) {
                  return Container(
                    margin: EdgeInsets.only(right: animations.animateBell(_bellCntrl).value),
                    height: 100,
                    width: 200 * 0.25,
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
            Positioned(
              top: 400,
              right: 500,
              child: Container(height: 200, width: 50, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      unawaited(_handCntrl.forward().orCancel);
      await Future.delayed(const Duration(milliseconds: 460));
      await _bellCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 1700)).whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
