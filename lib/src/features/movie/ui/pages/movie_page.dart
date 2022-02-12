import 'package:flutter/material.dart';

import '../decorators/animation_width_decorator.dart';
import '../../../../shared/const/images/images.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with TickerProviderStateMixin {
  static const _animationDuration = Duration(milliseconds: 80);
  var _animationRepeatCounter = 0;

  late final _leftWidthCntrl = AnimationController(duration: _animationDuration, vsync: this);
  late final _rightWidthCntrl = AnimationController(duration: _animationDuration, vsync: this);

  @override
  void dispose() {
    _leftWidthCntrl.dispose();
    _rightWidthCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  await _makePasscodeNotMatchesAnimation();
                },
                child: Text('Start')),
            Center(
              child: AnimationWidthDecorator(
                leftWidthCntrl: _leftWidthCntrl,
                rightWidthCntrl: _rightWidthCntrl,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(AppImages.grandmaRight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePasscodeNotMatchesAnimation() async {
    _resetCounter();
    try {
      const maxAnimationRepeat = 2;
      while (_animationRepeatCounter < maxAnimationRepeat) {
        await _leftWidthCntrl.forward().orCancel;
        await _leftWidthCntrl.reverse().orCancel;
        await _rightWidthCntrl.forward().orCancel;
        await _rightWidthCntrl.reverse().orCancel;
        _animationRepeatCounter++;
      }
    } on Exception catch (e) {
      debugPrint('Passcode ticker exception: ${e.toString()}');
    }
  }

  void _resetCounter() {
    _animationRepeatCounter = 0;
  }
}
