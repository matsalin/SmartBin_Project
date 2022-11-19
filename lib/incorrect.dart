// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/studentid.dart';

class Incorrect extends StatefulWidget {
  const Incorrect({super.key});

  @override
  State<Incorrect> createState() => _IncorrectState();
}

class _IncorrectState extends State<Incorrect> {
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
              fit: BoxFit.cover
            )
          ),
           child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70, right: 50,left: 50),
                                child: Image.asset('assets/images/cancel.png',height: 120, width: 120),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(60),
                                child: Text(
                                  "ไม่พบข้อมูล หรือ รหัสนิสิตไม่ถูกต้อง",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: 600,
                          height: 450,
                          decoration: ShapeDecoration(
                              color: Color.fromARGB(255, 236, 90, 71),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
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
                              return StudentID();
                            }));
                          }),
                          child: Text(
                            'ย้อนกลับ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'PK',
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )),
      );
}
