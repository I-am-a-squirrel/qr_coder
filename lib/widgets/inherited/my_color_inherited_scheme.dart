import 'package:flutter/material.dart';

class MyColorInheritedScheme extends InheritedWidget {
	const MyColorInheritedScheme({
		Key? key,
		required this.red,
		required this.green,
		required this.blue,
		required Widget child,
	}) : super(key: key, child: child);

	final bool red;
	final bool green;
	final bool blue;

	static MyColorInheritedScheme of(BuildContext context) {
		final MyColorInheritedScheme? result = context.dependOnInheritedWidgetOfExactType<MyColorInheritedScheme>();
		assert(result != null, "Theme not found in context");
		return result!;
	} 

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

	bool equalToOld(MyColorInheritedScheme old) => (red == old.red) && (green == old.green) && (blue == old.blue)

	void updateScheme(bool newRed, bool newGreen, bool newBlue) {
		this.red = newRed;
		this.green = newGreen;
		this.blue = newBlue;
	}

	@override
	bool updateShouldNotify(MyColorInheritedScheme old) => !equalToOld(old);
}
