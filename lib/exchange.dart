// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/finish.dart';

class exchange extends StatefulWidget {
  const exchange({super.key});

  @override
  State<exchange> createState() => _exchangeState();
}

class _exchangeState extends State<exchange> {
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  var now = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(15));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: Container(
        height: 2000,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/screen.png"),
                fit: BoxFit.cover)),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 550,
                height: 750,
                margin:
                    EdgeInsets.only(top: 50, left: 50, bottom: 50, right: 30),
                color: Color.fromARGB(255, 136, 215, 229),
                child: ListView(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.access_alarm_outlined,
                              color: Colors.black, size: 30),
                          Text(
                            '$minutes:$seconds',
                            style: TextStyle(
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30),
                          ),
                          Icon(Icons.calendar_month,
                              color: Colors.black, size: 30),
                          Text(
                            '${now.day}/${now.month}/${now.year}',
                            style: TextStyle(
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30),
                          )
                        ]),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: ShapeDecoration(
                              color: Colors.green[300],
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 3))),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/user.png',
                              height: 50,
                              width: 50,
                            ),
                            color: Colors.white,
                            onPressed: () {},
                            iconSize: 105,
                          ),
                        ),
                        Column(
                          children: [
                            Text("สวัสดี",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'PK',
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 300,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 102, 181, 246),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.black)),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 230,
                      height: 300,
                      margin: EdgeInsets.only(
                          top: 50, left: 30, bottom: 50, right: 30),
                      color: Color.fromARGB(255, 125, 185, 249),
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
                                  side:
                                      BorderSide(width: 3, color: Colors.black),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(20)),
                              onPressed: (() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return finish();
                                }));
                              }),
                              child: Text(
                                'ดูคะแนน',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'PK',
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 150,
                          height: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 61, 193, 63),
                                  side:
                                      BorderSide(width: 3, color: Colors.black),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(20)),
                              onPressed: (() {}),
                              child: Text(
                                'แลกขยะ',
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
            ),
            Expanded(
              child: Container(
                width: 550,
                height: 750,
                margin:
                    EdgeInsets.only(top: 50, left: 50, bottom: 50, right: 50),
                color: Color.fromARGB(255, 136, 215, 229),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: ShapeDecoration(
                                    color: Colors.green[300],
                                    shape: CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 3))),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/cans.png',
                                    height: 55,
                                    width: 55,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("กระป๋อง",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Container(
                              width: 100,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 102, 181, 246),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black)),
                                ),
                              )),
                          Container(
                            child: Text('ชิ้น',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'PK',
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: ShapeDecoration(
                                  color: Colors.green[300],
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 3))),
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/images/plastic.png',
                                  height: 55,
                                  width: 55,
                                ),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                                height: 10,
                              ),
                            Text("พลาสติกใส",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  )),
                          ],
                        ),
                        Container(
                            width: 100,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 102, 181, 246),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black)),
                              ),
                            )),
                        Container(
                          child: Text('ชิ้น',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: ShapeDecoration(
                                  color: Colors.green[300],
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 3))),
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/images/plastic-bottle.png',
                                  height: 55,
                                  width: 55,
                                ),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                             SizedBox(
                                height: 10,
                              ),
                            Text("พลาสติกขุ่น",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  )),
                          ],
                        ),
                        Container(
                            width: 100,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 102, 181, 246),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black)),
                              ),
                            )),
                        Container(
                          child: Text('ชิ้น',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: ShapeDecoration(
                                  color: Colors.green[300],
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 3))),
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/images/garbage.png',
                                  height: 55,
                                  width: 55,
                                ),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                             SizedBox(
                                height: 10,
                              ),
                            Text("ขยะทั่วไป",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  )),
                          ],
                        ),
                        Container(
                            width: 100,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 102, 181, 246),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black)),
                              ),
                            )),
                        Container(
                          child: Text('ชิ้น',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text('รวมทั้งหมด',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                            width: 100,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 102, 181, 246),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black)),
                              ),
                            )),
                        Container(
                          child: Text('ชิ้น',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'PK',
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
