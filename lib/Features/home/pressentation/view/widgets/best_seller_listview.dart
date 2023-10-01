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

import 'package:books_app/Features/home/pressentation/manger/newest_books_cubit/cubit/newest_books_cubit.dart';
import 'package:books_app/core/widgets/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => BookListVeiwItem(
              book: state.newestBooks[index],
            ),
            separatorBuilder: (context, index) => Container(height: 20),
            itemCount: state.newestBooks.length,
          );
        } else if (state is NewestBooksFailure) {
          return Center(
            child: CustomErrorWidget(errorMessage: state.error),
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}

class ShimmerTest extends StatelessWidget {
  const ShimmerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: const Text(
          'Shimmer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
