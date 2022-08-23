//State of Home page
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';
import 'package:qr_coder/classes/my_qr_code.dart';
import 'package:qr_coder/global_variables.dart';
import 'package:qr_coder/widgets/bloc/color_scheme_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';


class MyHomePageState extends State<MyHomePage> {
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
				MyCustomTheme(
					red: true,
					green: true,
					blue: true,
				),
			),
			child: BlocBuilder<ColorSchemeCubit, MyCustomTheme>(
				builder: (_, state) {
					return Theme(
						data: ThemeData(
							primaryColor: state.themeColor(
								Colors.blue,
							),
						),
						child:Scaffold(
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
															context.read<ColorSchemeCubit>().toggleRed();	
														},
                            value: state.red,
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
                             context.read<ColorSchemeCubit>().toggleGreen(); 
                            },
                            value: state.green,
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
                              context.read<ColorSchemeCubit>().toggleBlue();
                            },
                            value: state.blue,
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
			  				child: MyBody(),
    	   			),
     				),
					);
				},
			),
		);
  }
}
