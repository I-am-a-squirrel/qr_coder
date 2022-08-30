import 'package:objectdb/objectdb.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';
//Adaptation of MyCustomTheme for using with objectdb

class ColorThemeObjectdbSchema extends Schema {
	late final MyCustomTheme themeObject;

	ColorThemeObjectdbSchema(this.themeObject);

	MyCustomTheme fromTheme(Map theme) => theme['theme'];
	@override
	Map toMap() => {'themeObject' : themeObject};
}
