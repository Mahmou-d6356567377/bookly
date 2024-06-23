import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.homerepo) : super(NewestBooksCubitInitial());

  final Homerepo homerepo;

   Future<void> fetchNewestBooks () async{
   
   emit(NewestBooksCubitLoading());
   var result = await homerepo.fetchNewestBooks();
    result.fold((failure ) {
      emit(NewestBooksCubitFailure(failure.errorMsg));
    }, (books) {
      emit(NewestBooksCubitSuccess(books));
    });
  }
}
