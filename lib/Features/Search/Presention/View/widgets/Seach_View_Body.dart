import 'package:bookly/Features/Search/Presention/View/widgets/CustomSearchField.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 50, child: CustomSearchField()),
            ),
          ],
        ),
      ),
    );
  }
}
