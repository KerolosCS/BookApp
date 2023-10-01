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

import 'package:bloc/bloc.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_cubit_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksCubitState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String title}) async {
    emit(SimilarBooksCubitLoading());
    var res = await homeRepo.fetchSimilarBooks(title: title);
    res.fold(
      (fail) => emit(SimilarBooksCubitFailure(fail.errorMessage)),
      (similarBooks) {
        emit(SimilarBooksCubitSuccess(similarBooks));
      },
    );
  }
}
