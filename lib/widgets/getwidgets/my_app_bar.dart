import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_coder/widgets/states/my_body_state.dart';

class MyAppBar extends AppBar {
	const MyAppBar({Key? key, required String title}) {
		GFAppBar(
    	    //Menu in the AppBar
      	  leading: Builder(
        	  builder: (BuildContext context, ) {
          	  return GFIconButton(
            	  icon: const Icon(Icons.menu),
             	 onPressed: () {
              	  _advancedDrawerController.toggleDrawer();
              	},
        	    );
       	   },
      	  ),
       	 	title: Text(title),
      		centerTitle: true,
     	 );
	}
} 
