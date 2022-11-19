// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';

class screenstep extends StatefulWidget {
  const screenstep({super.key});

  @override
  State<screenstep> createState() => _screenstepState();
}

class _screenstepState extends State<screenstep> {
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
                    "วิธีใช้งาน",
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
                        width: 220,
                        height: 220,
                        decoration: ShapeDecoration(
                            color: Colors.green[300],
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/panic-button.png',
                            height: 130,
                            width: 130,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("1. กดปุ่มเริ่มใช้งาน",
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
                        width: 220,
                        height: 220,
                        decoration: ShapeDecoration(
                            color: Colors.green[300],
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: IconButton(
                            icon: Image.asset(
                              'assets/images/answer.png',
                              height: 130,
                              width: 130,
                            ),
                            color: Colors.white,
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("2. เลือกสะสมแต้ม หรือ บริจาค",
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
                        width: 220,
                        height: 220,
                        decoration: ShapeDecoration(
                            color: Colors.green[300],
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/littering.png',
                            height: 130,
                            width: 130,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                          iconSize: 105,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("3. ใส่ขยะที่ต้องการจะแลก",
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
                        width: 220,
                        height: 220,
                        decoration: ShapeDecoration(
                            color: Colors.green[300],
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/verified.png',
                            height: 130,
                            width: 130,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                          iconSize: 105,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("4. เสร็จสิ้น",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'PK',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
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
