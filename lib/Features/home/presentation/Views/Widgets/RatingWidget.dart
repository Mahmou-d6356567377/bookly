import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4D),
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text(
          '4.8',
          style: Styles.style15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(23443)',
          style: Styles.style14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
