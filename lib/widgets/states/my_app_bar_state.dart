//The state of MyAppBar
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyAppBarState extends State<MyAppBar> {
	@override
	Widget build(BuildContext context) {
		return GFAppBar(
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
        title: Text(widget.title),
        centerTitle: true,
      )
	}
}
