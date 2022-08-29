import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';

//Cubit to change global Color scheme

class ColorSchemeCubit extends Cubit<MyCustomTheme> {

	ColorSchemeCubit(MyCustomTheme initialTheme) : super(initialTheme); 

	void toggleRed() {
		var newState = state.changedRed;
		emit(newState);
	}

	void toggleGreen() {
		var newState = state.changedGreen;
		emit(newState);
	}

	void toggleBlue() {
		var newState = state.changedBlue;
		emit(newState);
	}
}
