//The root app of visual interface

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';
import 'package:qr_coder/global_variables.dart';
import 'package:qr_coder/widgets/bloc/color_scheme_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';

class QrApp extends StatelessWidget {
  const QrApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QR-coder',
			home: const MyHomePage(title: 'QR-coder'),
    );
  }
}
