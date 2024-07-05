import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractian_test/app_widget.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';
import 'package:tractian_test/src/core/dependencies/app_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColorsEnum.darkBlue.color,
  ));

  await AppDependency().start();

  runApp(const AppWidget());
}
