import 'package:flutter/material.dart';

//Theme data

class MyCustomTheme {
	MyCustomTheme({
		Key? key,
		required this.red,
		required this.green,
		required this.blue,
	});

	bool red;
	bool green;
	bool blue;

//Make my Color calculations smarter
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

	void updateScheme(bool newRed, bool newGreen, bool newBlue) {
		this.red = newRed;
		this.green = newGreen;
		this.blue = newBlue;
	}

}
