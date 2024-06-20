import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Search',
      suffix: const Icon(Icons.search),
      prefix: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back)),
    ));
  }
}
