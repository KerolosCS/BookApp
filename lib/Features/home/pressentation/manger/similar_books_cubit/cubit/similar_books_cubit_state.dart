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

part of 'similar_books_cubit_cubit.dart';

sealed class SimilarBooksCubitState extends Equatable {
  const SimilarBooksCubitState();

  @override
  List<Object> get props => [];
}

class SimilarBooksCubitInitial extends SimilarBooksCubitState {}

class SimilarBooksCubitFailure extends SimilarBooksCubitState {
  final String errorMsg;

  const SimilarBooksCubitFailure(this.errorMsg);
}

class SimilarBooksCubitSuccess extends SimilarBooksCubitState {
  final List<BookModel> similarBooks;

  const SimilarBooksCubitSuccess(this.similarBooks);
}

class SimilarBooksCubitLoading extends SimilarBooksCubitState {}
