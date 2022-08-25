import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/classes/my_qr_code.dart';

//Cubit to change my QrImage object

class MyQrCodeCubit extends Cubit<MyQrCode> {
	MyQrCodeCubit(MyQrCode initialQrCode) : super(initialQrCode);

	void updateData(String newData) => emit(
																				MyQrCode(
																					newData,
																					state.version,
																					state.errorCorrectionLevel,
																					state.backgroundColor,
																					state.foregroundColor,
																					state.errorWidgetHeight,
																					state.errorWidgetWidth,
																					state.errorText,
																				)
																			);
}
