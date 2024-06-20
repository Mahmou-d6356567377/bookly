import 'package:bookly/Features/home/presentation/Views/Widgets/book-list-view.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/styles.dart';
import 'Widgets/RatingWidget.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(backGroundColor),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: BookDetailsBody(),
    );
  }
}

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 7, child: Center(child: Image.asset(ktestImage))),
        Expanded(
          flex: 1,
          child: Text(
            'The Jungle Book',
            style: Styles.style30.copyWith(fontFamily: 'GT'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'J.K. Rowline ',
            style: Styles.style18.copyWith(color: Colors.blueGrey),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookRating(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .07,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.white,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '19.99',
                              style: Styles.style18.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ))),
                  Expanded(
                      child: Container(
                          color: const Color(0xffEF8262),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Free Preview',
                                style: Styles.style18.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )))),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '   You can also like ',
                  style: Styles.style18,
                ),
              ],
            )),
        SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: const BookListView()),
      ],
    );
  }
}