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
import 'package:books_app/Features/home/pressentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'app_bar_books_details.dart';
import 'books_detils_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const AppBarBookDetailsView(),
                const SizedBox(height: 12),
                BookDetailsSection(book: bookModel),
                const Expanded(
                  child: SizedBox(
                    height: 45,
                  ),
                ),
                const SimularBooksSection(),
                // const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
