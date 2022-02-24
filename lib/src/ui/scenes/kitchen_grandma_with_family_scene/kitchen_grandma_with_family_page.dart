import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/widgets.dart';

class KitchenGrandmaWithFamilyPage extends StatefulWidget {
  const KitchenGrandmaWithFamilyPage({Key? key}) : super(key: key);

  @override
  State<KitchenGrandmaWithFamilyPage> createState() => _KitchenGrandmaWithFamilyPageState();
}

class _KitchenGrandmaWithFamilyPageState extends State<KitchenGrandmaWithFamilyPage> with TickerProviderStateMixin {
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
              right: 380,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(0),
                child: Transform(
                  transform: Matrix4.rotationY(1800),
                  child: const Grandma(size: 220),
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 630,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(0),
                child: Transform(
                  transform: Matrix4.rotationY(1800),
                  child: const WifeWithKid(size: 330),
                ),
              ),
            ),
            const Positioned(
              top: 310,
              right: 160,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(0),
                child: UmarWithPresent(size: 360),
              ),
            ),
            const Positioned(
              top: 360,
              right: 360,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(0),
                child: GirlWithFlower(size: 300),
              ),
            ),
            const Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(top: 140.0),
                child: Center(child: KitchenTable()),
              ),
            ),
            const Positioned(
              top: 450,
              right: 520,
              child: Padding(
                padding: EdgeInsets.only(right: 200.0, top: 50),
                child: Apples(width: 100),
              ),
            ),
            const Positioned(
              top: 450,
              left: 500,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 200),
                child: Ris(width: 120),
              ),
            ),
            Positioned(
              top: 470,
              left: 380,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(0),
                child: Transform(
                  transform: Matrix4.rotationY(1800),
                  child: const CatStand(size: 130),
                ),
              ),
            ),
            const Positioned(
              top: 540,
              left: 390,
              child: Olives(width: 120),
            ),
            const Positioned(
              top: 510,
              left: 890,
              child: Olives(width: 120),
            ),
            const Positioned(
              top: 560,
              left: 860,
              child: Garlic(width: 40),
            ),
            Positioned(
              bottom: 300,
              right: 320,
              child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_fgltupfx.json',
                height: 160,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _animateScene() async {}
}
