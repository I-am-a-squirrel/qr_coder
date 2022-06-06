import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const QrApp());
}
/*
A class to describe all features of QR-code object
 */
class MyQrCode {
  String textForQrCode;
  int version;
  int errorCorrectionLevel;
  Color backgroundColor;
  Color foregroundColor;
  double errorWidgetHeight;
  double errorWidgetWidth;
  String errorText;
  Container errorStateBuilder () {
    return Container(
      height: errorWidgetHeight,
      width: errorWidgetWidth,
      child: Text(
        errorText,
      ),
    );
  }
  //Constructor
  MyQrCode (
      this.textForQrCode,
      this.version,
      this.errorCorrectionLevel,
      this.backgroundColor,
      this.foregroundColor,
      this.errorWidgetHeight,
      this.errorWidgetWidth,
      this.errorText,
      );
}

class QrApp extends StatelessWidget {
  const QrApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR-coder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'QR-coder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;//controller of text edit field
  /*Initializing QR-code for MyHomePage*/
  MyQrCode currentQrCode = MyQrCode(
      "Fuck all wars! Хуй всем войнам! 1921",//default textForQrCode
      7,//default version
      QrErrorCorrectLevel.H,//default errorCorrectLevel
      Colors.white,//default backgroundColor
      Colors.black,//default foregroundColor
      200.0,//default errorWidgetHeight
      200.0,//default errorWidgetWidth
      "Something's happened"//default errorText
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateQrCode(String qrCodeString, double widgetHeight, double widgetWidth) {
    setState((){
                  currentQrCode.textForQrCode = qrCodeString;//updating QR-code string
                  currentQrCode.errorWidgetHeight = 0.8 * widgetHeight ;//updating QR-code error massage height
                  currentQrCode.errorWidgetWidth = 0.8 * widgetWidth;//updating QR-code error message width
              });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            Widget generating QR-code
            */
            QrImage(
              data: currentQrCode.textForQrCode,//QR-code message
              version: currentQrCode.version,//QR-code version
              errorCorrectionLevel: currentQrCode.errorCorrectionLevel,//Correction level
              //Get the optimal size for QR-code based on context
              size: 0.8 * min(
                MediaQuery.of(context).size.width,//Width of the context
                MediaQuery.of(context).size.height//Height of the context
              ),
              backgroundColor: currentQrCode.backgroundColor,//Background color of this QR-code
              foregroundColor: currentQrCode.foregroundColor,//Foreground color of this QR-code
              errorStateBuilder: (cxt, err) {
                return currentQrCode.errorStateBuilder();//Error widget generating
                },
              ),
            TextField(
              controller: _controller,
              onSubmitted: (String localStringForQrCode) async {
                  currentQrCode.textForQrCode = localStringForQrCode;//updating QR-code string
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20)
              ),
              onPressed: () {
                updateQrCode(
                  currentQrCode.textForQrCode,
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                );
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
