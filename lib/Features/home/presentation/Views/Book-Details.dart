import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/book_details_body.dart';
import 'package:bookly/Features/home/presentation/manager/related_books_cubit/related_books_dart_cubit.dart';
import 'package:bookly/core/Helps/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailView extends StatefulWidget {
  final BookModel bookmodel;
  const BookDetailView({super.key, required this.bookmodel});
  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RelatedBooksDartCubit>(context).fetchrelatedBooks(topic: widget.bookmodel.kind!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(backGroundColor1),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:
                IconButton(onPressed: () {
                  final url = Uri.tryParse(widget.bookmodel.volumeInfo.infoLink!);

                  launchUrl(url as Uri);
                }, icon: const Icon(Icons.download)),
          ),
        ],
      ),
      body:  BookDetailsBody(bookmodel:widget.bookmodel));
  }
}

