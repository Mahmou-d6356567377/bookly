import 'package:bookly/Features/home/presentation/Views/Widgets/book-list-view.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/customerAppBar.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:bookly/core/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
      color: const  Color(backGroundColor),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          CustomAppBar(),
          BookListView(),
        Text(' Best seller', style:Styles.style18,
        ),
        BestSellerListViewItem(),
        ],
      ),
    ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      child: Row(
        children: [ 
          AspectRatio(
            aspectRatio: 2.5/4,
            child: Container( 
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(ktestImage) ,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}