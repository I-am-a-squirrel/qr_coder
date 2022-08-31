import 'package:objectdb/objectdb.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';
//Adaptation of MyCustomTheme for using with objectdb

class ColorThemeObjectdbSchema extends Schema {
	late final MyCustomTheme themeObject;

	ColorThemeObjectdbSchema(this.themeObject);

	static ColorThemeObjectdbSchema fromMap(Map themeMap) => ColorThemeObjectdbSchema(themeMap['theme']);

	@override
	Map toMap() => {'themeObject' : themeObject};
}
