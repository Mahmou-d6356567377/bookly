import 'package:bookly/Features/home/presentation/Views/Widgets/BestItem.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/customLoadingindicator.dart';
import 'package:bookly/Features/home/presentation/Views/Widgets/error_widget.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubitCubit, NewestBooksCubitState>(
      
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess){
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: state.books.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              return  BestSellerListViewItem(bookmodel: state.books[index]);
            });
        }else if (state is NewestBooksCubitFailure){
          return  CustomErrorWidget(errMsg: state.ErrorMessage);
        }else{
            return const customLoadingindicator();
        }
      },
    );
  }
}
