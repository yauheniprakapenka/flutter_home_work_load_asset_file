import 'dart:async';

import 'package:flutter/material.dart';
import 'animations/animate_opacity.dart';

class MobileAppPage extends StatefulWidget {
  const MobileAppPage({Key? key}) : super(key: key);

  @override
  State<MobileAppPage> createState() => _MobileAppPageState();
}

class _MobileAppPageState extends State<MobileAppPage> with SingleTickerProviderStateMixin {
  late final _opacityCntrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  );

  @override
  void initState() {
    super.initState();
    _animateScene();
  }

  @override
  void dispose() {
    _opacityCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 700,
                width: double.maxFinite,
                child: Image.asset('assets/images/other/app.png', fit: BoxFit.cover),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Android', style: _getTextStyle()),
                    Text('Web', style: _getTextStyle()),
                    Text('iOS', style: _getTextStyle()),
                    Image.asset(
                      'assets/images/qr/qr-landing.png',
                      height: 200,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _opacityCntrl,
            builder: (_, __) {
              return Opacity(
                opacity: animateOpacity(_opacityCntrl).value,
                child: Container(
                  color: const Color(0xFFfaec69),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyle() {
    return const TextStyle(fontSize: 44, fontWeight: FontWeight.bold);
  }

  Future<void> _animateScene() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      await _opacityCntrl.forward().orCancel;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
