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
