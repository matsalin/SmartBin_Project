// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/choose.dart';
import 'package:flutter_application_1/qrcode.dart';
import 'package:flutter_application_1/studentid.dart';

class screenaccumulate extends StatefulWidget {
  const screenaccumulate({super.key});

  @override
  State<screenaccumulate> createState() => _screenaccumulateState();
}

class _screenaccumulateState extends State<screenaccumulate> {
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
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "เข้าสู่ระบบ",
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
                height: 90,
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
                            'assets/images/qr-code.png',
                            height: 170,
                            width: 170,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QRcode();
                            }));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("สแกน QR Code",
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
                              'assets/images/student-card.png',
                              height: 170,
                              width: 170,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StudentID();
                              }));
                            }),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("ป้อนรหัสนิสิต",
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
                            return screenselecte();
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
