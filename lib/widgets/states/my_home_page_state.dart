//State of Home page

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_coder/widgets/getwidgets/my_app_bar.dart';

class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); //key for current status of Scaffold
  
  late TextEditingController _qrCodeTextController; //controller of text edit field
  late AdvancedDrawerController _advancedDrawerController; //controller for body animation
  
  
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
    _qrCodeTextController = TextEditingController();
  }

  @override
  void dispose() {
    _qrCodeTextController.dispose();
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
    if(_scaffoldKey.currentState!.isDrawerOpen){
      _closeDrawer();
    }else{
      _openDrawer();
    };
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(),
      body: MyBody(),
     );
  }
}
