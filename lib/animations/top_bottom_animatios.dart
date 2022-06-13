import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import '../model/enums.dart';


class TopBottomAnimaitons extends StatelessWidget {
  final double delay;
  final Widget child;
  final Curve curve;

  const TopBottomAnimaitons({
    required Key key,
    required this.delay,
    required this.child,
    this.curve = Curves.easeOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tween = TimelineTween<AniProp>()
      ..addScene(begin: 0.milliseconds, duration: 500.milliseconds)
          .animate(AniProp.opacity, tween: 0.0.tweenTo(1.0))
      ..addScene(begin: 0.milliseconds, end: 500.milliseconds).animate(
        AniProp.translateY,
        tween: (-30.0).tweenTo(0.0),
        curve: curve,
      );

    return PlayAnimation<TimelineValue<AniProp>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      child: child,
      tween: _tween,
      builder: (context, child, value) => Transform.translate(
        offset: Offset(0, value.get(AniProp.translateY)),
        child: Opacity(opacity: value.get(AniProp.opacity), child: child),
      ),
    );
  }
}
