/*
 *
 *
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2023] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/search/data/repos/search_repo.dart';
import 'package:books_app/core/errors/failures.dart';
import 'package:books_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplemnt implements SearchRepo {
  final ApiService api;
  SearchRepoImplemnt(this.api);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
    String search,
  ) async {
    List<BookModel> books = [];
    try {
      var data = await api.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$search',
      );

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
}
