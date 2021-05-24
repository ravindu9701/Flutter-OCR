import 'package:flutter/material.dart';

import 'ocr_detection.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: OCRPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


