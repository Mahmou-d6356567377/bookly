import 'package:bookly/Features/Splash/Presentation/Views/Widgets/SlidingText.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(animationController);

    // Start the animation when the widget is initialized
    animationController.forward();
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
