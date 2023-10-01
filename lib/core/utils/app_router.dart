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
import 'package:books_app/Features/home/data/repos/home_repo_implement.dart';
import 'package:books_app/Features/home/pressentation/manger/similar_books_cubit/cubit/similar_books_cubit_cubit.dart';
import 'package:books_app/Features/home/pressentation/view/book_details_view.dart';
import 'package:books_app/Features/home/pressentation/view/home_veiew.dart';
// import 'package:books_app/Features/search/data/repos/search_repo.dart';
import 'package:books_app/Features/search/data/repos/search_repo_implemt.dart';
import 'package:books_app/Features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:books_app/Features/search/presentation/views/search_view.dart';
import 'package:books_app/core/utils/service_locater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/view/splach_vew.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            books: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
            getIt.get<SearchRepoImplemnt>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
