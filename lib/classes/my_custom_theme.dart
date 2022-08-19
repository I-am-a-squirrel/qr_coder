import 'package:flutter/material.dart';

//Theme data

class MyCustomTheme {

	late final bool _red;
	late final bool _green;
	late final bool _blue;

	MyCustomTheme({
		Key? key,
		required bool red,
		required bool green,
		required bool blue,
	});

	void set red(bool red) => _red = red;
	void set green(bool green) => _green = green;
	void set blue(bool blue) => _blue = blue;

//Make my Color calculations smarter
	Color themeColor(Color defaultColor) {
    int intRed = _red ? 255 : 0;
    int intGreen = _green ? 255 : 0;
    int intBlue = _blue ? 255 : 0;

    if (_red && _green && _blue) {
      return defaultColor; //Default preferences
    }else{
      return Color.fromARGB(255, intRed, intGreen, intBlue); //Customized preferences
    };
  }

//Returns a new theme with reversed red parameter
	MyCustomTheme get changedRed {
		return MyCustomTheme(
			red: !_red,
			green: _green,
			blue: _blue,
		);
	}

//Returns a new theme with reversed green parameter
	MyCustomTheme get changedGreen {
		return MyCustomTheme(
			red: _red,
			green: !_green,
			blue: _blue,
		);
	}

//Returns a new theme with reversed blue parameter
	MyCustomTheme get changedBlue {
		return MyCustomTheme(
			red: _red,
			green: _green,
			blue: !_blue,
		);
	}
}
