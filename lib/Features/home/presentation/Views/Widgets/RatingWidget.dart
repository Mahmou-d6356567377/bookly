import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});
  

  final String rating;
  final int count;

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
        const  Text(
          '3',
          style: Styles.style15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text('$count'
           ,
          style: Styles.style14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
