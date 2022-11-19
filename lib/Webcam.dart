// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class Webcam extends StatefulWidget {
  const Webcam({super.key});

  @override
  State<Webcam> createState() => _WebcamState();
}

class _WebcamState extends State<Webcam> {
  @override
  void initState() {
    super.initState();
    initRenderer();
    _getUserMedia();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    _localRenderer.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final _localRenderer = new RTCVideoRenderer();

  _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio' : false,
      'video' : {
        'facingMode': 'user',
      },
    };
    // ignore: deprecated_member_use
    MediaStream stream = await navigator.getUserMedia(mediaConstraints);
    _localRenderer.srcObject = stream;
  }

  initRenderer() async {
    await _localRenderer.initialize();
  }

  @override
 Widget build(BuildContext context) => Scaffold(
  body: Container(
    child: new Stack(
      children: <Widget>[
        new Positioned(
          top:0.0,
          right:0.0,
          left:0.0,
          bottom:0.0,
          child: new Container(
            child: new RTCVideoView(_localRenderer),
          ),
        ),
      ],
    ),
  ),
 );
}
