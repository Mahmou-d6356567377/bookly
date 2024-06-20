import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Read as you wish ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PoetsenOne-Regular',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
          ),
        );
      },
    );
  }
}
