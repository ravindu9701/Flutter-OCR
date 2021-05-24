
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';


class OCRPage extends StatefulWidget {
  @override
  _OCRPageState createState() => _OCRPageState();
}

class _OCRPageState extends State<OCRPage> {

  int OCR_CAM = FlutterMobileVision.CAMERA_BACK;
  String word = "TEXT";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Real time OCR'),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: RaisedButton(
                   onPressed: _read,
                   color: Colors.red,
                   child: Text('Start Scanning',
                     style: TextStyle(fontSize: 16),
                   ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> words = [];
    try {
      words = await FlutterMobileVision.read(
        camera: OCR_CAM,
        waitTap: true,
      );

      setState(() {
        word = words[0].value;
      });
    } on Exception {
      words.add( OcrText('Unable to recognize the word'));
    }
  }
}