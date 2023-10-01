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

// import 'package:books_app/Features/home/pressentation/view/book_details_view.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/pressentation/view/widgets/custom_book_image.dart';
import 'package:books_app/core/utils/app_router.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../constant.dart';
// import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListVeiwItem extends StatelessWidget {
  const BookListVeiwItem({
    super.key,
    required this.book,
  });

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(16),
            //   child: AspectRatio(
            //       //  width/height /
            //       aspectRatio: 1.4 / 2.1,
            //       child: CachedNetworkImage(
            //         fit: BoxFit.fill,
            //         imageUrl: book.volumeInfo.imageLinks!.thumbnail!,
            //       )),
            // ),
            CustomBookImage(imageUrl: book.volumeInfo.imageLinks!.thumbnail!),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtsectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    book.volumeInfo.authors?[0] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14.copyWith(
                      color: const Color(0xff84828C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          rate: book.volumeInfo.maturityRating!,
                          count: book.volumeInfo.pageCount ?? 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
