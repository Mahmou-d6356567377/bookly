import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/RatingWidget.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/related_books_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/Helps/constants.dart';
import '../../../../../core/styles/styles.dart';


class BookDetailsBody extends StatelessWidget {

  final BookModel bookmodel;
  const BookDetailsBody({
    super.key,
   required this.bookmodel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Color(backGroundColor1),
            Color(backGroundColor2),
            Color(backGroundColor3),
            Color(backGroundColor4),
            Color(backGroundColor5),
            Color(backGroundColor6),
            Color(backGroundColor7),
            Color(backGroundColor8),
            Color(backGroundColor9),
            ],
          ),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 7, child: Center(child: GestureDetector(
            onTap: (){
              final url = bookmodel.volumeInfo.canonicalVolumeLink;
               final uri= Uri.tryParse(url! );
               launchUrl(uri as Uri);
            },
            child: CachedNetworkImage(imageUrl: bookmodel.volumeInfo.imageLinks!.thumbnail,
            fit: BoxFit.fill
            ,placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
          ),),),
          Expanded(
            flex: 1,
            child: Text(
              bookmodel.volumeInfo.title?? 'no title ',
              style: Styles.style30.copyWith(fontFamily: 'GT'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              bookmodel.volumeInfo.authors.toString() ,
              style: Styles.style18.copyWith(color: Colors.blueGrey),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BookRating(
                  rating: '3',
                  count: 34,
                ),
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
                                '${bookmodel.volumeInfo.pageCount}',
                                style: Styles.style18.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ))),
                    Expanded(
                        child: Container(
                            color: const Color(0xffEF8262),
                            child: TextButton(
                                onPressed: () {
                                  final url = bookmodel.volumeInfo.previewLink;
                                   final uri= Uri.tryParse(url! );
                                   launchUrl(uri as Uri);
                                },
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
              child:  Relatedbooklistview(bookmode: bookmodel)),
        ],
      ),
    );
  }
}
