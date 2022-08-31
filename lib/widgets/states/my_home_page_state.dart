//State of Home page
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'package:objectdb/src/objectdb_storage_indexeddb.dart';
import 'package:qr_coder/classes/my_custom_theme.dart';
import 'package:qr_coder/widgets/bloc/color_scheme_cubit.dart';
import 'package:qr_coder/widgets/stateful/my_body.dart';
import 'package:qr_coder/widgets/stateful/my_home_page.dart';

class MyHomePageState extends State<MyHomePage> {
	final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();

  Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => ColorSchemeCubit(),
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
