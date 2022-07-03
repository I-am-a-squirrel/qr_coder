import 'dart:math';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import 'package:getwidget/getwidget.dart';

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
    
/*

*/

class ColorTheme {
  bool red;
  bool green;
  bool blue;

  ColorTheme(
    this.red,
    this.green,
    this.blue,
  );

  Color themeColor(Color defaultColor) {
    int intRed = this.red ? 255 : 0;
    int intGreen = this.green ? 255 : 0;
    int intBlue = this.blue ? 255 : 0;

    if (this.red && this.green && this.blue) {
      return defaultColor; //Default preferences
    }else{
      return Color.fromARGB(255, intRed, intGreen, intBlue); //Customized preferences
    };
  }
  
}

class QrApp extends StatelessWidget {
  const QrApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR-coder',
      //Not sure if theme even needed. To try remove later!
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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

  ColorTheme currentColorTheme = ColorTheme(
    true,
    true,
    true,
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

  void updateColorTheme(bool nextRed, bool nextGreen, bool nextBlue) {
    setState((){
                  currentColorTheme.red = nextRed;
                  currentColorTheme.green = nextGreen;
                  currentColorTheme.blue = nextBlue;
                });
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState!.closeDrawer();
  }

  void _switchDrawerState() {
    if(_scaffoldKey.currentState.isDrawerOpen){
      _closeDrawer();
    }else{
      _openDrawer();
    };
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
        //Menu in the AppBar
        leading: Builder(
          builder: (BuildContext context) {
            return GFIconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _switchDrawerState();
              },
            );
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
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
            GFTextField(
              controller: _controller,
              //TextField look
              decoration: InputDecoration(
                constraints: BoxConstraints.expand(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 20,
                ),
              ),
              onChanged: (String localStringForQrCode) async {
                currentQrCode.textForQrCode = localStringForQrCode;//updating QR-code string
              },
            ),
            //Update button
            GFButton(
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
      drawer: GFDrawer(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GFToggle(
                        onChanged: (bool? redValue) {
                          updateColorTheme(redValue as bool, currentColorTheme.green, currentColorTheme.blue);
                        },
                        value: currentColorTheme.red,
                      ),
                      const Divider(),
                      GFToggle(
                        onChanged: (bool? greenValue) {
                          updateColorTheme(currentColorTheme.red, greenValue as bool, currentColorTheme.blue);
                        },
                        value: currentColorTheme.green,
                      ),
                      const Divider(),
                      GFToggle(
                        onChanged: (bool? blueValue) {
                          updateColorTheme(currentColorTheme.red, currentColorTheme.green, blueValue as bool);
                        },
                        value: currentColorTheme.blue,
                      ),
                    ],
                  ), 
                );
    );
  }
}
