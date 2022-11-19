
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LOGIN_QRCODE extends StatefulWidget {
  const LOGIN_QRCODE({super.key});

  @override
  State<LOGIN_QRCODE> createState() => _LOGIN_QRCODEState();
}

class _LOGIN_QRCODEState extends State<LOGIN_QRCODE> {

 Future<void> getData() async {
  final url = Uri.parse("https://kusesmartbin.csc.ku.ac.th/api/v1/bin/secret/login/qrcode'");
   http.Response response = await http.get(url);

   print(response);

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
    return Scaffold(
      body: Container(
        
      ),
    );
  }
}