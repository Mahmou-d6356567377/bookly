import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/customLoadingindicator.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/error_widget.dart';
import 'package:bookly/Features/home/presentation/manager/related_books_cubit/related_books_dart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Utils/routes.dart';

class Relatedbooklistview extends StatelessWidget {
  const Relatedbooklistview({super.key, required this.bookmode});
  
  final BookModel bookmode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksDartCubit, RelatedBooksDartState>(
      builder: (context, state) {
      if(state is RelatedBooksDartSuccess){
        return    SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics:  const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                   GoRouter.of(context).push(AppRoutes.bd , extra: state.books[index]);
      },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: CachedNetworkImage(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const  Icon(Icons.error_outline),),
                      ),
                    ),
                  ))),
        );
      }else if( state is RelatedBooksDartFailure){
        return    CustomErrorWidget(errMsg:  state.errmsg,);
      }else{
        return const customLoadingindicator();
      }
      },
    );
  }
}
