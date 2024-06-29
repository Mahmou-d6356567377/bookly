import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'related_books_dart_state.dart';

class RelatedBooksDartCubit extends Cubit<RelatedBooksDartState> {
  RelatedBooksDartCubit(this.homerepo) : super(RelatedBooksDartInitial(),);


   final Homerepo homerepo;

  Future<void> fetchrelatedBooks ({required String topic}) async{
   emit(RelatedBooksDartLoading());
   var result = await homerepo.fetchRelateddBooks(category: topic);
    result.fold((failure ) {
      emit(RelatedBooksDartFailure(failure.errorMsg));
    }, (books) {
      emit(RelatedBooksDartSuccess(books));
    });
}
}