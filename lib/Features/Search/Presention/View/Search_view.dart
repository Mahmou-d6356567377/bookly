import 'package:bookly/Features/Search/Presention/View/widgets/Seach_View_Body.dart';
import 'package:flutter/cupertino.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: SearchViewBody());
  }
}
