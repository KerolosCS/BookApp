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

import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_action.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.book,
  });

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: SizedBox(
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
          ),
        ),
        const SizedBox(height: 35),
        Text(book.volumeInfo.title ?? 'Book', style: Styles.textStyle30),
        const SizedBox(height: 8),
        Opacity(
          opacity: 0.7,
          child: Text(
            textAlign: TextAlign.center,
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const BookRating(
            mainAxisAlignment: MainAxisAlignment.center, count: 5, rate: 'ds'),
        const SizedBox(height: 32),
        BookButtonAction(bookModelAction: book),
      ],
    );
  }
}
