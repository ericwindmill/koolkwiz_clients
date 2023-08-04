import 'dart:async';

import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';

class QuizTimerWidget extends StatefulWidget {
  QuizTimerWidget({super.key});

  @override
  State<QuizTimerWidget> createState() => _QuizTimerWidgetState();
}

class _QuizTimerWidgetState extends State<QuizTimerWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Timer _timer;
  int _start = 30;

  @override
  void initState() {
    startTimer();
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: Duration(seconds: 30),
    )..addListener(() {
        setState(() {});
      });
    controller.reverse(from: 30);
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Marketplace.spacing2.toDouble()),
      child: Column(
        children: <Widget>[
          Text(
            "00:$_start",
            style: Marketplace.heading2,
          ),
          LinearProgressIndicator(
            minHeight: 10,
            value: controller.value,
          )
        ],
      ),
    );
  }
}
