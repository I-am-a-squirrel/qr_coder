import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/main.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';

//Cubit to change global Color scheme

class ColorSchemeCubit extends Cubit<MyCustomTheme> {

	ColorSchemeCubit() : super(themeBox!.get('themeBoxKey') as MyCustomTheme); 

	void toggleRed() {
		var newState = state.changedRed;
		themeBox!.clear();
		themeBox!.put(
			'themeBoxKey',
			newState,
		);
		emit(newState);
	}

	void toggleGreen() {
		var newState = state.changedGreen;
		themeBox!.clear();
		themeBox!.put(
			'themeBoxKey',
			newState,
		);
		emit(newState);
	}

	void toggleBlue() {
		var newState = state.changedBlue;
		themeBox!.clear();
		themeBox!.put(
			'themeBoxKey',
			newState,
		);
		emit(newState);
	}
}
