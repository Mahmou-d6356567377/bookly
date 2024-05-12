import 'package:flutter/material.dart';
import '../../../../core/Helps/constants.dart';
import 'Widgets/PlashViewBody.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold( 
    backgroundColor: Color(backGroundColor),
      body: SplashViewBody(),
    );
  }
}