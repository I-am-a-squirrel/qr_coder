//State for QR-code ecosystem
import 'dart:math' show min;

import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/classes/my_qr_code.dart';
import 'package:qr_coder/global_variables.dart';
import 'package:qr_coder/widgets/bloc/my_qr_code_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyBodyState extends State<MyBody> {
late TextEditingController _qrCodeTextController; //controller of text field

	Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => MyQrCodeCubit(
				MyQrCode(
      		"Fuck all wars! Хуй всем войнам! 1921",//default textForQrCode
      		7,//default version
      		QrErrorCorrectLevel.H,//default errorCorrectLevel
      		Colors.white,//default backgroundColor
      		Colors.black,//default foregroundColor
      		MediaQuery.of(context).size.height,//default errorWidgetHeight
      		MediaQuery.of(context).size.width,//default errorWidgetWidth
      		"Something's happened"//default errorText
  			)
			),
			child: BlocBuilder<MyQrCodeCubit, MyQrCode>(
				builder: (_, state) {
					return Container(
          				color: backgroundColor,
          				child: Center(
          					child: Column(
            					mainAxisAlignment: MainAxisAlignment.center,
              				children: <Widget>[
    	          			/*
      	        			Widget generating QR-code
          	      		*/
												QrImage(
                					data: state.textForQrCode,//QR-code message
                					version: state.version,//QR-code version
													errorCorrectionLevel: state.errorCorrectionLevel,//Correction level
      	          				//Get the optimal size for QR-code based on context
                  				size: 0.8 * min(
        	          				MediaQuery.of(context).size.width,//Width of the context
          	        				MediaQuery.of(context).size.height//Height of the context
            	    				),
	                				backgroundColor: state.backgroundColor,//Background color of this QR-code
    	              			foregroundColor: state.foregroundColor,//Foreground color of this QR-code
      	            			errorStateBuilder: (cxt, err) {
        	          				return state.errorStateBuilder();//Error widget generating
          	        			},
            	    			),
                  			GFTextField(
      	            			controller: _qrCodeTextController,
        	          			//TextField look
        	          			decoration: InputDecoration(
            	          		hintText: "Input your text",
              	      			constraints: BoxConstraints.expand(
      	                			width: MediaQuery.of(context).size.width * 0.8,
        	              			height: 20,
          	          			),
            	      			),
            	      			onChanged: (String localStringForQrCode) async {
              	      			context.read<MyQrCodeCubit>().updateData(localStringForQrCode);//updating QR-code string
                	  			},
    	            			),
      	        			],
  	          			),
      	      		),
        	 			);
				}
			),
		);
	}
}
