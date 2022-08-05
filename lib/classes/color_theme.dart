import 'package:flutter/material.dart';

/*
  The current color theme state
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
