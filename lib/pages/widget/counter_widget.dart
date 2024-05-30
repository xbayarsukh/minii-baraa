import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  final Animation<int> animation;

  const Countdown({super.key, required this.animation})
      : super(listenable: animation);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
