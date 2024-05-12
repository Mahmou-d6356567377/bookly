import 'package:bookly/core/Helps/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Features/Splash/Presentation/Views/splashView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData().copyWith(scaffoldBackgroundColor:const  Color(backGroundColor)),
   debugShowCheckedModeBanner: false,
      home: const  SplashView(),
    );
  }
}
