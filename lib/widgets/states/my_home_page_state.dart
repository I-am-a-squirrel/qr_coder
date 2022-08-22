//State of Home page
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_coder/classes/my_qr_code.dart';
import 'package:qr_coder/widgets/bloc/color_scheme_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';


class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); //key for current status of Scaffold
  late TextEditingController _qrCodeTextController; //controller of text field
	final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    _qrCodeTextController = TextEditingController();
  }

  @override
  void dispose() {
    _qrCodeTextController.dispose();
    super.dispose();
  }

  /*Initializing QR-code for MyHomePage*/
  MyQrCode currentQrCode = MyQrCode(
      "Fuck all wars! Хуй всем войнам! 1921",//default textForQrCode
      7,//default version
      QrErrorCorrectLevel.H,//default errorCorrectLevel
      Colors.white,//default backgroundColor
      Colors.black,//default foregroundColor
      200.0,//default errorWidgetHeight
      200.0,//default errorWidgetWidth
      "Something's happened"//default errorText
  );

  @override
  Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => ColorSchemeCubit(
				initialTheme: MyCustomTheme(
					red: true,
					green: true:
					blue: true,
				)
			),
			child: Scaffold(
      					key: scaffoldKey,
								appBar:GFAppBar(
    	    				//Menu in the AppBar
      	  				leading: Builder(
        	  				builder: (BuildContext context) {
          	  				return GFIconButton(
            	  				icon: const Icon(Icons.menu),
             	 					onPressed: () {
              	  				advancedDrawerController.toggleDrawer();
												},
        	    				);
       	   					},
      	  				),
       	 					title: Text(widget.title),
      						centerTitle: true,
     	 					),
      				  body:AdvancedDrawer(
									drawer: GFDrawer(
                    child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /*
                      Red color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? redValue) {
															MyColorInheritedScheme.updateScheme(redValue, _, _);	
														},
                            value: MyColorInheritedScheme.of(myHomePageContext).red,
                            enabledTrackColor: Colors.red,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),
                      
                      const Divider(),
                      /*
                      Green color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? greenValue) {
                              updateColorTheme(currentColorTheme.red, greenValue as bool, currentColorTheme.blue);
                            },
                            value: MyColorInheritedScheme.of(myHomePageContext).green,
                            enabledTrackColor: Colors.green,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),

                      const Divider(),
                      /*
                      Blue color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? blueValue) {
                              updateColorTheme(currentColorTheme.red, currentColorTheme.green, blueValue as bool);
                            },
                            value: MyColorInheritedScheme.of(myHomePageContext).blue,
                            enabledTrackColor: Colors.blue,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),

                      const Divider(),
                    ],
                  ),
                ),
      				  controller: advancedDrawerController,
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
    	   			),
     				),
		);
  }
}
