part of 'related_books_dart_cubit.dart';

sealed class RelatedBooksDartState extends Equatable {
  const RelatedBooksDartState();

  @override
  List<Object> get props => [];
}

final class RelatedBooksDartInitial extends RelatedBooksDartState {}
final class RelatedBooksDartLoading extends RelatedBooksDartState {}
final class RelatedBooksDartFailure extends RelatedBooksDartState {
 final String errmsg;
  const RelatedBooksDartFailure(  this.errmsg);
}

final class RelatedBooksDartSuccess extends RelatedBooksDartState {

  final List<BookModel> books;
  const RelatedBooksDartSuccess(this.books);

  
}
