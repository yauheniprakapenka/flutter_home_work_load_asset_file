import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/scene_manager.dart';
import '../../widgets/widgets.dart';

class FamilyDrivingCarPage extends StatefulWidget {
  const FamilyDrivingCarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FamilyDrivingCarPageState();
  }
}

class _FamilyDrivingCarPageState extends State<FamilyDrivingCarPage> {
  final _backgroundImageCntrl = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _animateScene();
    });
  }

  @override
  void dispose() {
    _backgroundImageCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animateScene();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.blue[50])),
                Expanded(child: Container(color: Colors.grey[600])),
              ],
            ),
          ),
          Positioned.fill(
            child: Center(
              child: SizedBox(
                height: 600,
                child: ListView.builder(
                  controller: _backgroundImageCntrl,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 800,
                      color: Colors.deepPurple,
                      child: Image.asset(
                        'assets/images/city/street.jpg',
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 240.0, left: 400),
              child: Center(
                child: Transform(
                  transform: Matrix4.rotationY(pi),
                  child: const CarWithFamily(size: 400),
                ),
              ),
            ),
          ),
          PlayButton(onPressed: _animateScene),
        ],
      ),
    );
  }

  Future<void> _animateScene() async {
    try {
      unawaited(
        _backgroundImageCntrl.animateTo(
          10000,
          duration: const Duration(seconds: 40),
          curve: Curves.linear,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 5000)).whenComplete(() {
        Provider.of<SceneManager>(context, listen: false).nextScene();
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
