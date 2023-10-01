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
import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/functions/url_lancher.dart';

class BookButtonAction extends StatelessWidget {
  const BookButtonAction({
    super.key,
    required this.bookModelAction,
  });
  final BookModel bookModelAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              txt: 'Free',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              buttonBackgroundColor: Colors.white,
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              txt: getTxt(bookModelAction),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              buttonBackgroundColor: const Color(0xffEF8262),
              style: Styles.textStyle16.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //  fontFamily: GoogleFonts().gloryTextTheme,
              ),
              onPressed: () {
                lanchUrlMethod(
                  context,
                  bookModelAction.volumeInfo.previewLink,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getTxt(BookModel bookModelAction) {
    if (bookModelAction.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
