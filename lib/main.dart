// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Webcam.dart';
import 'package:flutter_application_1/choose.dart';
import 'package:flutter_application_1/step.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
Future <void> main() async{
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                height: 160,
              ),
              Expanded(
                child: Row(
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
                                  side: BorderSide(
                                      color: Colors.white, width: 5))),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/cans.png',
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
                        Text("กระป๋อง \n 60 คะแนน",
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
                                  side: BorderSide(
                                      color: Colors.white, width: 5))),
                          child: IconButton(
                              icon: Image.asset(
                                'assets/images/plastic.png',
                                height: 130,
                                width: 130,
                              ),
                              color: Colors.white,
                              onPressed: () {}),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text("พลาสติกใส \n 40 คะแนน",
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
                                  side: BorderSide(
                                      color: Colors.white, width: 5))),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/plastic-bottle.png',
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
                        Text("พลาสติกขุ่น \n 30 คะแนน",
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
                                  side: BorderSide(
                                      color: Colors.white, width: 5))),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/garbage.png',
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
                        Text("ขยะทั่วไป \n 10 คะแนน",
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
                          'เริ่มใช้งาน',
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
                            side: BorderSide(width: 3, color: Colors.black),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(20)),
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return screenstep();
                          }));
                        }),
                        child: Text(
                          'วิธีใช้งาน',
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
                            side: BorderSide(width: 3, color: Colors.black),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(20)),
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Webcam();
                          }));
                        }),
                        child: Text(
                          'CAM',
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
