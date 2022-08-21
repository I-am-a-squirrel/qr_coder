//State of Home page

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_coder/classes/my_qr_code.dart';
import 'package:qr_coder/widgets/bloc/advanced_drawer_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_flutter/qr_flutter.dart';


class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); //key for current status of Scaffold
  
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
			create: (BuildContext advancedDrawerContext) => AdvancedDrawerCubit(AdvancedDrawerValue.hidden()),
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
      				  body: const MyBody(),
     					),

		);
  }
}
