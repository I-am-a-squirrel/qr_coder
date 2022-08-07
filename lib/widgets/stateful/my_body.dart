//The body of QrApp
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer_dart';
import 'package:qr_coder/widgets/getwidgets/my_drawer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyBody extends StatefulWidget {
	Widget build(BuildContext context) {
		return AdvancedDrawer(
        key: _advancedDrawerKey,
        drawer: MyDrawer(),
        controller: _advancedDrawerController,
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*
                Widget generating QR-code
                */
                QrImage(
                  data: currentQrCode.textForQrCode,//QR-code message
                  version: currentQrCode.version,//QR-code version
                  errorCorrectionLevel: currentQrCode.errorCorrectionLevel,//Correction level
                  //Get the optimal size for QR-code based on context
                  size: 0.8 * min(
                    MediaQuery.of(context).size.width,//Width of the context
                    MediaQuery.of(context).size.height//Height of the context
                  ),
                  backgroundColor: currentQrCode.backgroundColor,//Background color of this QR-code
                  foregroundColor: currentQrCode.foregroundColor,//Foreground color of this QR-code
                  errorStateBuilder: (cxt, err) {
                    return currentQrCode.errorStateBuilder();//Error widget generating
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
                      currentQrCode.textForQrCode = localStringForQrCode;//updating QR-code string
                    },
                  ),
                  //Update button
                  GFButton(
                    onPressed: () {
                      updateQrCode(
                        currentQrCode.textForQrCode,
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                      );
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
         ),
       )
	}
}