import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/classes/my_qr_code.dart';

//Cubit to change my QrImage object

class MyQrCodeCubit extends Cubit<MyQrCode> {
	MyQrCodeCubit(MyQrCode initialQrCode) : super(initialQrCode);

	void updateData(String newData) => emit(
																				MyQrCode(
																					textForQrCode: newData,
																					version: state.version,
																					errorCorrectionLevel: state.errorCorrectionLevel,
																					backgroundColor: state.backgroundColor,
																					foregroundColor: state.foregroundColor,
																					errorWidgetHeight: state.errorWidgetHeight,
																					errorWidgetWidth: state.errorWidgetWidth,
																					errorText: state.errorText,
																				)
																			);
}
