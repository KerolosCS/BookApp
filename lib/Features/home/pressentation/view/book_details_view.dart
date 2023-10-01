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
import 'package:books_app/Features/home/pressentation/manger/similar_books_cubit/cubit/similar_books_cubit_cubit.dart';
import 'package:books_app/Features/home/pressentation/view/widgets/book_details_veiw_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.books,
  });
  final BookModel books;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      title: widget.books.volumeInfo.title ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(bookModel: widget.books),
      ),
    );
  }
}
