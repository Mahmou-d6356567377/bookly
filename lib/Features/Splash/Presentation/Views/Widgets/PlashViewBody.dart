import 'package:bookly/Features/Splash/Presentation/Views/Widgets/SlidingText.dart';
import 'package:bookly/Features/home/presentation/Views/homeView.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initslidingAnimation();
   
   navigateToHome();
  
  }

  void initslidingAnimation() {
     animationController = AnimationController(
      vsync: this,
     duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 10),
     end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
     Future.delayed(const Duration(seconds: 2), 
    (){
     // Get.to(()=> const HomeView(), transition: Transition.fade,duration: ktransitionDuration);
     GoRouter.of(context).push('/homeview');
    });
      
  }



  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(kLogoImage),
        // Ensure SlidingText widget listens to animation changes
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: slidingAnimation.value,
              child: child,
            );
          },
          child: SlidingText(slidingAnimation: slidingAnimation,),
        ),
      ],
    );
  }
}
