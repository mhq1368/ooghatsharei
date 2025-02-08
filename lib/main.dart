import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ooghatsharei/Controllers/theme_controller.dart';
import 'package:ooghatsharei/Views/splash_screen.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController tc = Get.put(ThemeController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var heightsize = MediaQuery.of(context).size.height;
    // var widthsize = MediaQuery.of(context).size.width;
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('fa'),
        theme: lightTheme,
        darkTheme: darkTheme,
        home: SplashScreen());
  }
}
