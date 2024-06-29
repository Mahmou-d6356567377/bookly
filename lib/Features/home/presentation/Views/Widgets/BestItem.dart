import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/RatingWidget.dart';
import 'package:bookly/core/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/styles/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookmodel});

final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.bd, extra:  bookmodel) ;
      },
      child: SizedBox(
        height: 126,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                  image:  DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(bookmodel.volumeInfo.imageLinks?.thumbnail?? ''),
                    
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookmodel.volumeInfo.title!,
                        style: Styles.style20.copyWith(fontFamily: 'GT'),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookmodel.volumeInfo.authors![0],
                    style: Styles.style14.copyWith(color: Colors.blueGrey),
                    maxLines: 1,
                    
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'FREE',
                        style: Styles.style20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                       Expanded(
                          child: Row(
                        children: [
                          const Spacer(),
                          BookRating(rating: bookmodel.volumeInfo.maturityRating!, count: bookmodel.volumeInfo.pageCount!  ),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
