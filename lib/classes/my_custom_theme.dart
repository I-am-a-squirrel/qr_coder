import 'package:flutter/material.dart';

//Theme data

class MyCustomTheme {

	late final bool red;
	late final bool green;
	late final bool blue;

	MyCustomTheme({
		Key? key,
		required bool red,
		required bool green,
		required bool blue,
	});

//Make my Color calculations smarter
	Color themeColor(Color defaultColor) {
    int intRed = red ? 255 : 0;
    int intGreen = green ? 255 : 0;
    int intBlue = blue ? 255 : 0;

    if (red && green && blue) {
      return defaultColor; //Default preferences
    }else{
      return Color.fromARGB(255, intRed, intGreen, intBlue); //Customized preferences
    };
  }

//Returns a new theme with reversed red parameter
	MyCustomTheme get changedRed {
		return MyCustomTheme(
			red: !red,
			green: green,
			blue: blue,
		);
	}

//Returns a new theme with reversed green parameter
	MyCustomTheme get changedGreen {
		return MyCustomTheme(
			red: red,
			green: !green,
			blue: blue,
		);
	}

//Returns a new theme with reversed blue parameter
	MyCustomTheme get changedBlue {
		return MyCustomTheme(
			red: red,
			green: green,
			blue: !blue,
		);
	}
}
