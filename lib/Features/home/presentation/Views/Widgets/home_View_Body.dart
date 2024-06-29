import 'package:bookly/Features/home/presentation/Views/Widgets/BestSellerCrollView.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/book-list-view.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/customerAppBar.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:bookly/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      // we use customscrollview to build nested scroll view
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
             
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    BookListView(),
                    Text(
                      ' Best seller',
                      style: Styles.style18,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
           SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListView(),
            ),
          )
        ],
      ),
    );
  }
}
