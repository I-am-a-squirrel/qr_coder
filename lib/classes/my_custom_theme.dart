import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//Theme data

part 'my_custom_theme.g.dart';

@HiveType(typeId: 1)
class MyCustomTheme {

	MyCustomTheme({
		Key? key,
		required bool this.red,
		required bool this.green,
		required bool this.blue,
	});

	@HiveField(0)
	final bool red;

	@HiveField(1)
	final bool green;

	@HiveField(2)
	final bool blue;

//Make my Color calculations smarter
	Color themeColor(Color defaultColor) {
    int intRed = red ? 255 : 0;
    int intGreen = green ? 255 : 0;
    int intBlue = blue ? 255 : 0;

    if (red && green && blue) {
      return defaultColor; //Default preferences
    }else{
      return Color.fromARGB(255, intRed, intGreen, intBlue); //Customized preferences
    }
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
