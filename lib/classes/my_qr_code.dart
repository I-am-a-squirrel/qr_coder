import 'package:flutter/material.dart';
//A class to describe all features of Qr-code object
class MyQrCode {
  String? textForQrCode;
  int? version;
  int? errorCorrectionLevel;
  Color? backgroundColor;
  Color? foregroundColor;
  double? errorWidgetHeight;
  double? errorWidgetWidth;
  String? errorText;
  Container errorStateBuilder () {
    return Container(
      height: errorWidgetHeight,
      width: errorWidgetWidth,
      child: Text(
        errorText as String,
      ),
    );
  }
  //Constructor
  MyQrCode ({
      this.textForQrCode,
      this.version,
      this.errorCorrectionLevel,
      this.backgroundColor,
      this.foregroundColor,
      this.errorWidgetHeight,
      this.errorWidgetWidth,
      this.errorText,
  });
}

