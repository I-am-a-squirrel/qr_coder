import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

//Cubit to manage AdvancedDrawer

class AdvancedDrawerCubit extends Cubit<AdvancedDrawerValue> {
	AdvancedDrawerCubit(AdvancedDrawerValue initialAdvancedDrawerState) : super(initialAdvancedDrawerState);

	final advancedDrawerController = AdvancedDrawerController();
}
