//The root app of visual interface

import 'package:flutter/material.dart';
import '/widgets/stateful/my_home_page.dart';

class QrApp extends StatelessWidget {
  const QrApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR-coder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: backgroundColor,
      ),
      home: const MyHomePage(title: 'QR-coder'),
    );
  }
}
