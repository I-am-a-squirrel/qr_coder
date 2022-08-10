//State of Home page

import 'package:flutter/material.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_coder/widgets/getwidgets/my_app_bar.dart';
import 'package:qr_coder/classes/my_qr_code.dart';

class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); //key for current status of Scaffold
  
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(),
      body: MyBody(),
     );
  }
}
