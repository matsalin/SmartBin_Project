// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';

class Count_Timer extends StatefulWidget {
  const Count_Timer({super.key});

  @override
  State<Count_Timer> createState() => _Count_TimerState();
}

class _Count_TimerState extends State<Count_Timer> {
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final minutes = strDigits(myDuration.inMinutes.remainder(15));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: Container(
        child: Container(
          child: ListView(
            children: <Widget>[
              Text(
                '$minutes:$seconds',
                style: TextStyle(
                    fontFamily: 'PK',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
