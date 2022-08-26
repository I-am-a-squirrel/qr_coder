import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';

//Cubit to change global Color scheme

class ColorSchemeCubit extends Cubit<MyCustomTheme> {

	Box<MyCustomTheme> myThemeBox = Hive.box<MyCustomTheme>('myThemeBox');

	ColorSchemeCubit(MyCustomTheme initialTheme) {
		if(myThemeBox.isEmpty) {
			myThemeBox.put(
				'myThemeBoxKey',
				MyCustomTheme(
					red: true,
					green: true,
					blue: true,
				),
			);
		}else{
			myThemeBox.get('myThemeBoxKey');
		}
	}

	void toggleRed() {
		var newState = state.changedRed;
		myThemeBox.clean();
		myThemeBox.put(
			'myThemeBoxKey',
			newState,
		);
		emit(newState);
	}

	void toggleGreen() {
		var newState = state.changedGreen;
		myThemeBox.clean();
		myThemeBox.put(
			'myThemeBoxKey',
			newState,
		);
		emit(newState);
	}

	void toggleBlue() {
		var newState = state.changedBlue;
		myThemeBox.clean();
		myThemeBox.put(
			'myThemeBoxKey',
			newState,
		);
		emit(newState);
	}
}
