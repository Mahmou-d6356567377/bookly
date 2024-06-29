import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/Utils/ApiService.dart';
import 'package:bookly/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements Homerepo{

  final ApiService apiservice;

  HomeRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
        var data = await apiservice.get(endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:flutter');

  List<BookModel> books =[];

  for (var Item in data['items']) {
    books.add(BookModel.fromJson(Item));
  }
    return right(books);
} catch (e) {
    if( e is DioException){

    return left(ServerFailure.DioException(e));
    }
    return left(ServerFailure(e.toString()));
}
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
       try {
        var data = await apiservice.get(endpoint: 'volumes?Filtering=free-ebooks&q=subject:programming');

  List<BookModel> books =[];

  for (var Item in data['items']) {
    books.add(BookModel.fromJson(Item));
  }
    return right(books);
} catch (e) {
    if( e is DioException){

    return left(ServerFailure.DioException(e));
    }
    return left(ServerFailure(e.toString()));
}
  }
  
  @override
  Future<Either<Failure,List<BookModel>>> fetchRelateddBooks({required String category}) async{
      try {
        var data = await apiservice.get(endpoint: 'volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:programming');

  List<BookModel> books =[];

  for (var Item in data['items']) {
    books.add(BookModel.fromJson(Item));
  }
    return right(books);
} catch (e) {
    if( e is DioException){

    return left(ServerFailure.DioException(e));
    }
    return left(ServerFailure(e.toString()));
}
  }
    
}

