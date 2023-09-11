import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/data/repos/home_repo.dart';
import 'package:books_app/core/errors/failures.dart';
import 'package:books_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        if (item['volumeInfo']['imageLinks'] != null &&
            item['volumeInfo'] != null) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        if (item['volumeInfo']['imageLinks'] != null) {
          books.add(BookModel.fromJson(item));
        }
        // print('Length of featured list without null : ${books.length}');
        // print('Length of featured list with null : ${data['items'].length}');
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        // print('Error is : ${e.toString()}');
        return left(ServerFailure.fromDiorError(e));
      }
      // print('Error is : ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String title}) async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$title',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        if (item['volumeInfo']['imageLinks'] != null) {
          books.add(BookModel.fromJson(item));
        }
        // print('Length of featured list without null : ${books.length}');
        // print('Length of featured list with null : ${data['items'].length}');
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        // print('Error is : ${e.toString()}');
        return left(ServerFailure.fromDiorError(e));
      }
      // print('Error is : ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
}
