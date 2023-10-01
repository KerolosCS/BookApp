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

import 'package:books_app/Features/home/pressentation/manger/similar_books_cubit/cubit/similar_books_cubit_cubit.dart';
import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_image.dart';

class RecommendedBooksListView extends StatelessWidget {
  const RecommendedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksCubitState>(
      builder: (context, state) {
        if (state is SimilarBooksCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .205,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.similarBooks[index],
                      );
                    },
                    child: CustomBookImage(
                      imageUrl: state.similarBooks[index].volumeInfo.imageLinks
                              ?.thumbnail ??
                          '',
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(width: 8),
                itemCount: state.similarBooks.length,
              ),
            ),
          );
        } else if (state is SimilarBooksCubitFailure) {
          return CustomErrorWidget(errorMessage: state.errorMsg);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
