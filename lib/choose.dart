// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/accumulate.dart';
import 'package:flutter_application_1/exchange.dart';
import 'package:flutter_application_1/main.dart';

class screenselecte extends StatefulWidget {
  const screenselecte({super.key});

  @override
  State<screenselecte> createState() => _screenselecteState();
}

class _screenselecteState extends State<screenselecte> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

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
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/screen.png"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "เลือกรายการที่ต้องการ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'PK',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: ShapeDecoration(
                            color: Colors.green[300],
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/piggy-bank.png',
                            height: 170,
                            width: 170,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return screenaccumulate();
                            }));
                          },
                        ),
                      ),
                      SizedBox(height: 50),
                      Text("สะสมแต้ม",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'PK',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: ShapeDecoration(
                            color: Colors.green[300],
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: IconButton(
                            icon: Image.asset(
                              'assets/images/donation.png',
                              height: 170,
                              width: 170,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return exchange();
                              }));
                            }),
                      ),
                      SizedBox(height: 50),
                      Text("บริจาค",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'PK',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 61, 193, 63),
                            side: BorderSide(width: 3, color: Colors.black),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(20)),
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyApp();
                          }));
                        }),
                        child: Text(
                          'ย้อนกลับ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'PK',
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
