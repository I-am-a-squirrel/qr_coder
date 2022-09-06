//State of Home page
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:objectdb/objectdb.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';
import 'package:qr_coder/widgets/bloc/color_scheme_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';
import 'package:qr_coder/widgets/objectdb/color_theme_objectdb_schema.dart';

class MyHomePageState extends State<MyHomePage> {

	final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
	MyCustomTheme? defaultTheme;
	SchemaDB<ColorThemeObjectdbSchema>? db;
	
	final regexAll = RegExp(RegExp.escape(''), caseSensitive: false);
	
	bool isDbEmpty(SchemaDB<ColorThemeObjectdbSchema> db) {
		var result = db.find({
			'themeObject': regexAll
		});
		bool? resultBool;
		result.then((List<ColorThemeObjectdbSchema> resultSchemaList) {
			resultBool = resultSchemaList.isEmpty;
		});
		return resultBool!;
	}

	MyCustomTheme themeFromDB(SchemaDB<ColorThemeObjectdbSchema> db) {
		var result = db.first({
			'themeObject': regexAll
		});
		MyCustomTheme? resultTheme;
		result.then((ColorThemeObjectdbSchema theme) {
			resultTheme = theme.toMap()['themeObject'];
		});
		return resultTheme!;
	}

	void initTheme(db) {
		if(isDbEmpty(db)) {
			defaultTheme = MyCustomTheme(
				red: true,
				green: true,
				blue: true,
			);
		}else{
			defaultTheme = themeFromDB(db);
		}
	}

	@override
	void initState() {
		super.initState();
		final path = (Platform.isAndroid || Platform.isLinux) ? (Directory.current.path + '/theme.db') : '';
		final storage = path == '' ? IndexedDBStorage('theme') : FileSystemStorage(path);
		final db = SchemaDB<ColorThemeObjectdbSchema> (
			storage,
			(themeMap) => ColorThemeObjectdbSchema.fromMap(themeMap),
		);
		initTheme(db);
	}

	@override
	void dispose() {
		db!.cleanup();
		db!.insert(ColorThemeObjectdbSchema.fromMap({'themeObject': defaultTheme!}));
		super.dispose();
	}

  Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => ColorSchemeCubit(defaultTheme!),
			child: BlocBuilder<ColorSchemeCubit, MyCustomTheme>(
				builder: (context, state) {
					return Theme(
						data: ThemeData(
							primaryColor: state.themeColor(
								Colors.blue,
							),
						),
						child:Scaffold(
								appBar:GFAppBar(
    	    				//Menu in the AppBar
													leading: IconButton(
            	  									icon: const Icon(Icons.menu),
             	 										onPressed: () {
              	  									advancedDrawerController.toggleDrawer();
																	},
        	    									),
       	 									title: Text(widget.title),
      										centerTitle: true,
     	 									),
      				  body:AdvancedDrawer(
									drawer: GFDrawer(
                    child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /*
                      Red color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? redValue) {
															context.read<ColorSchemeCubit>().toggleRed();	
														},
                            value: state.red,
                            enabledTrackColor: Colors.red,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),
                      
                      const Divider(),
                      /*
                      Green color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? greenValue) {
															context.read<ColorSchemeCubit>().toggleGreen();
                            },
                            value: state.green,
                            enabledTrackColor: Colors.green,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),

                      const Divider(),
                      /*
                      Blue color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? blueValue) {
                              context.read<ColorSchemeCubit>().toggleBlue();
                            },
                            value: state.blue,
                            enabledTrackColor: Colors.blue,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),

                      const Divider(),
                    ],
                  ),
                ),
      				  controller: advancedDrawerController,
			  				child: const MyBody(),
    	   			),
     				),
					);
				},
			),
		);
  }
}
