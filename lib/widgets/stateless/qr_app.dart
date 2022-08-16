//The root app of visual interface

import 'package:flutter/material.dart';
import '/widgets/stateful/my_home_page.dart';
import 'package:qr_coder/global_variables.dart';

class QrApp extends StatelessWidget {
  const QrApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR-coder',
			/*
			//default theme data I am going to replace by InheritedWidget
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: backgroundColor,
      ),
			*/
      home: const MyHomePage(title: 'QR-coder'),
    );
  }
}
