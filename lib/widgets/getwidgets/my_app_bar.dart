import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';

class MyAppBar extends AppBar {
	MyAppBar() {
		GFAppBar(
    	    //Menu in the AppBar
      	  leading: Builder(
        	  builder: (BuildContext context) {
          	  return GFIconButton(
            	  icon: const Icon(Icons.menu),
             	 onPressed: () {
              	  _advancedDrawerControllerKey.toggleDrawer();
              	},
        	    );
       	   },
      	  ),
       	 	title: Text(MyHomePage.title),
      		centerTitle: true,
     	 );
	}
} 
