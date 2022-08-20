import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';

//Cubit to change global Color scheme

class ColorSchemeCubit extends Cubit<MyCustomTheme> {
	ColorSchemeCubit(MyCustomTheme initialTheme) : super(initialTheme);

	void toggleRed() => emit(state.changedRed);
	void toggleGreen() => emit(state.changedGreen);
	void toggleBlue() => emit(state.changedBlue);
}
