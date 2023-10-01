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

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(String search);
}
