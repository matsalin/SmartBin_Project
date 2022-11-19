// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/choose.dart';
import 'package:flutter_application_1/exchange.dart';
import 'package:flutter_application_1/incorrect.dart';
import 'accumulate.dart';
import 'widget/num_pad.dart';
import 'package:http/http.dart' as http;

class StudentID extends StatefulWidget {
  const StudentID({super.key});

  @override
  State<StudentID> createState() => _StudentIDState();
}

class _StudentIDState extends State<StudentID> {
  final TextEditingController _myController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      http.post(
          Uri.parse(
              "https://kusesmartbin.csc.ku.ac.th/api/v1/bin/secret/login/uname"),
          headers: {
            "X-Bin-ID": "1",
            "X-Bin-Client": "dd8943cf-8834-4622-a87c-a29931b4ff95",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: {
            'uname': 'b${passwordController.text}',
          }).then((response) {
        print("Reponse status : ${response.statusCode}");
        print("Response body : ${response.body}");
        var myresponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return exchange();
          }));

          print("Login successfully");
        } else if (response.statusCode == 404) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Incorrect();
          }));
          print("กรอกให้ครบนะจ๊ะ");
        } else if (response.statusCode == 422) {
          print("ไม่พบนะจ๊ะ");
        }
      });
    } catch (e) {
      print(e.toString());
    }
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
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/screen.png"),
                  fit: BoxFit.cover)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        style: TextStyle(fontSize: 30),
                        controller: passwordController,
                        readOnly: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 192, 230, 242),
                            hintText: "ป้อนรหัสนิสิต",
                            enabledBorder: OutlineInputBorder( borderSide: const BorderSide(color: Colors.black, width: 2)),
                            hintStyle: TextStyle(fontSize: 25)),
                      ),
                      SizedBox(height: 45),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 61, 193, 63),
                                  side:
                                      BorderSide(width: 3, color: Colors.black),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(20)),
                              onPressed: (() {
                                login();
                              }),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'ยืนยัน',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          SizedBox(width: 35),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 57, 57),
                                  side:
                                      BorderSide(width: 3, color: Colors.black),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(20)),
                              onPressed: (() {
                                passwordController.text =
                                    passwordController.text.substring(
                                        0, passwordController.text.length - 1);
                              }),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, right: 35),
                                child: Text(
                                  'ลบ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontFamily: 'PK',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 124, 217, 96),
                              side: BorderSide(width: 3, color: Colors.black),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(20)),
                          onPressed: (() {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return screenaccumulate();
                          }));
                          }),
                          child: Text(
                            'ย้อนกลับ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontFamily: 'PK',
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                width: 550,
                height: 550,
                margin:
                    EdgeInsets.only(top: 50, left: 100, bottom: 50, right: 100),
                color: Color.fromARGB(255, 106, 168, 180),
                alignment: Alignment.center,
                child: NumPad(
                  buttonSize: 90,
                  buttonColor: Color.fromARGB(255, 255, 255, 255),
                  iconColor: Color.fromARGB(255, 0, 0, 0),
                  controller: passwordController,
                  delete: () {
                    passwordController.text = passwordController.text
                        .substring(0, passwordController.text.length - 1);
                  },
                  onSubmit: () {
                    login();
                  },
                ),
              )),
            ],
          ),
        ),
      );
}
