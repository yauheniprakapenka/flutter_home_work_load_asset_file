import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';
import 'animations/animate_car.dart';

class FamilyArrivedPage extends StatefulWidget {
  const FamilyArrivedPage({Key? key}) : super(key: key);

  @override
  State<FamilyArrivedPage> createState() => _FamilyArrivedPageState();
}

class _FamilyArrivedPageState extends State<FamilyArrivedPage> with TickerProviderStateMixin {
  late final _animateCarCntrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _animateCarCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned.fill(
              child: ColoredBox(color: Color.fromARGB(255, 197, 227, 235)),
            ),
            Positioned(
              top: 480,
              left: 480,
              child: Container(
                height: 220,
                width: 120,
                color: Colors.grey,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 295,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 73, 97, 67),
              ),
            ),
            const Positioned.fill(
              child: Center(child: GrandmaHouse(size: 900)),
            ),
            const Positioned(
              top: 0,
              left: 200,
              child: SizedBox(
                height: 295,
                child: Cloud(size: 200),
              ),
            ),
            const Positioned(
              top: 20,
              right: 200,
              child: SizedBox(
                height: 295,
                child: Cloud(size: 200),
              ),
            ),
            Positioned(
              bottom: 100,
              right: -250,
              child: Center(
                child: AnimatedBuilder(
                    animation: _animateCarCntrl,
                    builder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.only(right: animateCar(_animateCarCntrl).value),
                        child: const CarWithFamily(size: 400),
                      );
                    }),
              ),
            ),
            Positioned(
              top: 200,
              left: 100,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow[400],
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
      await _animateCarCntrl.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 1700)).whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
