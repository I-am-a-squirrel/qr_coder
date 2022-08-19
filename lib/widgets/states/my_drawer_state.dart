//The state of drawer widget for body
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_coder/widgets/getwidgets/my_drawer.dart';

class MyDrawerState extends State<MyDrawer> {
	Widget build(BuildContext context) {
		return GFDrawer(
                    child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /*
                      Red color deactivation toggle
                      */
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? redValue) {
															MyColorInheritedScheme.updateScheme(redValue, _, _);	
														},
                            value: MyColorInheritedScheme.of(myHomePageContext).red,
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
                          padding: EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? greenValue) {
                              updateColorTheme(currentColorTheme.red, greenValue as bool, currentColorTheme.blue);
                            },
                            value: MyColorInheritedScheme.of(myHomePageContext).green,
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
                          padding: EdgeInsets.all(10.0),//free space around
                          child: GFToggle(
                            onChanged: (bool? blueValue) {
                              updateColorTheme(currentColorTheme.red, currentColorTheme.green, blueValue as bool);
                            },
                            value: MyColorInheritedScheme.of(myHomePageContext).blue,
                            enabledTrackColor: Colors.blue,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ),

                      const Divider(),
                    ],
                  ),
                );
	}
}
