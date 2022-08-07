//Home page

import 'package:flutter/material.dart';
import 'package:qr_coder/widgets/states/my_home_page_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}
