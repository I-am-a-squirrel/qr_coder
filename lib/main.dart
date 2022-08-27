import 'package:icons_launcher/constants.dart';
import 'package:icons_launcher/custom_exceptions.dart';
import 'package:icons_launcher/main.dart';
import 'package:icons_launcher/utils.dart';
import 'package:icons_launcher/xml_templates.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_generator/hive_generator.dart';
import 'package:flutter/material.dart';

import 'package:qr_coder/classes/my_custom_theme.dart';
import 'package:qr_coder/widgets/stateless/qr_app.dart';

Box<MyCustomTheme>? themeBox;

void main() async {
	await Hive.initFlutter();
	Hive.registerAdapter(MyCustomThemeAdapter());
	themeBox = await Hive.openBox('themeBox');
	if(themeBox!.isEmpty) {
		themeBox!.put(
			'themeBoxKey',
			MyCustomTheme(
				red: true,
				green: true,
				blue: true,
			),
		);	
	}
  runApp(const QrApp());
}
