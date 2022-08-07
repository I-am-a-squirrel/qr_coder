import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyAppBar extends StatefulWidget {
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
