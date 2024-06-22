import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/Utils/ApiService.dart';
import 'package:bookly/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements Homerepo{

  final ApiService apiservice;

  HomeRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
        var data = await apiservice.get(endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:programming');

  List<BookModel> books =[];

  for (var Item in data['items']) {
    books.add(BookModel.fromJson(Item));
  }
    return right(books);
} on Exception catch (e) {

    return left(ServerFailure());
}
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
  
}