import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBooksInitial());

  final  Homerepo homerepo ;
  Future<void> fetchFeaturedBooks() async{


   emit(FeaturedBooksLoading());
   var result = await homerepo.fetchFeaturedBooks();
   result.fold((failure) {
     emit(FeaturedBooksfailure(failure.errorMsg));
   }, (books) {
    emit(FeaturedBooksSuccess(books));  
   });
  }
}
