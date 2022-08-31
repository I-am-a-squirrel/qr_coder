import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'package:objectdb/src/objectdb_storage_indexeddb.dart';

import 'package:qr_coder/classes/my_custom_theme.dart';
import 'package:qr_coder/widgets/objectdb/color_theme_objectdb_schema.dart';

//Cubit to change global Color scheme

class ColorSchemeCubit extends Cubit<MyCustomTheme> {

	ColorSchemeCubit(MyCustomTheme initialTheme) : super(initialTheme); 

	var regexAll = RegExp(RegExp.escape(''), caseSensitive: false);

	factory ColorSchemeCubit.fromDB() {
		final Platform userDevice = Platform();
	
		if (userDevice.isAndroid || userDevice.isLinux) {
			final path = Directory.current.path + '/theme.db';
			var storage = FileSystemStorage(path);
		}

		if (userDevice.isWeb) {
			var storage = IndexedDBStorage('theme');
		}
		
		final db = SchemaDB<ColorThemeObjectdbSchema> (
			storage,
			(themeMap) => ColorThemeObjectdbSchema.fromMap(themeMap),
		);

		if (isDbEmpty(db)) {
			return ColorSchemeCubit(
				MyCustomTheme(
					red: true,
					green: true,
					blue: true,
				)
			);
		}else{
			return ColorSchemeCubit(
				themeFromDB(db)
			);
		}
	}

	static bool isDbEmpty(SchemaDB<ColorThemeObjectdbSchema> db) {
		return FutureBuilder<List?>(
			future: db.find({
				'themeObject': regexAll
			}),
			builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
				return snapshot.data.isEmpty;
			},
		);
	}

	static Future<MyCustomTheme> themeFromDB(SchemaDB<ColorThemeObjectdbSchema> db) {
		return FutureBuilder<MyCustomTheme>(
			future: db.first({
				'themeObject': regexAll
			}),
			builder: (BuildContext context, AsyncSnapshot<MyCustomTheme> snapshot) {
				return snapshot.data;
			},
		);

	}

	void toggleRed() {
		var newState = state.changedRed;
		emit(newState);
	}

	void toggleGreen() {
		var newState = state.changedGreen;
		emit(newState);
	}

	void toggleBlue() {
		var newState = state.changedBlue;
		emit(newState);
	}
}
