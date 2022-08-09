import 'package:flutter/material.dart';
import 'package:qr_coder/widgets/states/my_app_bar_state.dart';

class MyAppBar extends AppBar {
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
      );
} 
