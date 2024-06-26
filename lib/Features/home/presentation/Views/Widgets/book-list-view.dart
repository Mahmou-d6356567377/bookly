import 'package:bookly/Features/home/presentation/Views/Widgets/customLoadingindicator.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/error_widget.dart';
import 'package:bookly/Features/home/presentation/manager/Featured_Books_Cubit/featured_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Utils/routes.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
      if(state is FeaturedBooksSuccess){
        return    SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics:  const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (
                (context, index) {
                   final book = state.books[index];
                  return GestureDetector(
                  onTap: () {
                   GoRouter.of(context).push(AppRoutes.bd , extra: book);
      },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: CachedNetworkImage(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail?? '',
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const  Icon(Icons.error_outline),),
                      ),
                    ),
                  );
                  }
                  )
                  )
        );
      }else if( state is FeaturedBooksfailure){
        return    CustomErrorWidget(errMsg:  state.ErrorMsg,);
      }else{
        return const customLoadingindicator();
      }
      },
    );
  }
}
