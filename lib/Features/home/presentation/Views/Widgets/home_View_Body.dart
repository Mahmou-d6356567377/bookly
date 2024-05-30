
import 'package:bookly/Features/home/presentation/Views/Widgets/BestItem.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/book-list-view.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/customerAppBar.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:bookly/core/styles/styles.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
      color: const  Color(backGroundColor),
      child: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            CustomAppBar(),
            BookListView(),
          Text(' Best seller', style:Styles.style18,
          ),
          SizedBox(height: 20,),
        
          BestSellerListViewItem(),
          ],
        ),
      ),
    ),
    );
  }
}

