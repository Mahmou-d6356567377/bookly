

import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo{

  Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();
    Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
}