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

part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> searchedBooks;

  const SearchBooksSuccess(this.searchedBooks);
}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  const SearchBooksFailure(this.errMessage);
}
