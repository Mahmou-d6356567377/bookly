import 'package:bookly/Features/Search/Presention/View/widgets/Seach_View_Body.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/Views/Book-Details.dart';
import 'package:bookly/Features/home/presentation/Views/homeView.dart';
import 'package:bookly/Features/home/presentation/manager/related_books_cubit/related_books_dart_cubit.dart';
import 'package:bookly/core/Utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Splash/Presentation/Views/splashView.dart';

abstract class AppRoutes {
  static const bd = '/bookdetails';
  static const sv = '/SearchView';
  static const hm = '/homeview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: hm, builder: (context, state) => const HomeView()),
      GoRoute(
        path: bd,
        builder: (context, state) {
          final extra = state.extra;  
          print('Recieved Extra is : $extra');
          if (extra is BookModel) { 
            return BlocProvider(
              create: (context) => RelatedBooksDartCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailView(bookmodel: extra), 
               
            );
          } else {
            // Handle the case where extra is not a BookModel
            return  Scaffold(
              body: Center(child: GestureDetector(
                
                onTap: (){
                  GoRouter.of(context).pop();
                },
                
                child: const Text('Invalid book details'))),  
            );
          }
        },
      ),
      GoRoute(
        path: sv,
        builder: (context, state) => const SearchViewBody(),
      ),
    ],
  );
}
