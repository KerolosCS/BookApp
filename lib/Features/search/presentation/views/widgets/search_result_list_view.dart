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

import 'package:books_app/Features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/pressentation/view/widgets/best_seller_item.dart';
// import '../../../../home/pressentation/view/widgets/best_seller_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                BookListVeiwItem(book: state.searchedBooks[index]),
            separatorBuilder: (context, index) => Container(height: 20),
            itemCount: state.searchedBooks.length,
          );
        } else if (state is SearchBooksFailure) {
          return const CustomErrorWidget(errorMessage: "Search here");
        } else if (state is SearchBooksLoading) {
          return const LoadingIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
