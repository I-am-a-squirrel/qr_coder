import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyAppBar extends AppBar {
	MyAppBar({Key? key, required String title}) {
		GFAppBar(
    	    //Menu in the AppBar
      	  leading: Builder(
        	  builder: (BuildContext context, ) {
          	  return GFIconButton(
            	  icon: const Icon(Icons.menu),
             	 onPressed: () {
              	  _advancedDrawerControllerKey.toggleDrawer();
              	},
        	    );
       	   },
      	  ),
       	 	title: Text(title),
      		centerTitle: true,
     	 );
	}
} 
