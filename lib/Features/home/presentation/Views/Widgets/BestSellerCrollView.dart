import 'package:bookly/Features/home/presentation/Views/Widgets/BestItem.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemBuilder: (context, index) {
          return const BestSellerListViewItem();
        });
  }
}
