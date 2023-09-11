import 'package:books_app/Features/home/data/repos/home_repo_implement.dart';
import 'package:books_app/Features/home/pressentation/manger/featuredBooksCubit/featured_books_cubit.dart';
import 'package:books_app/Features/home/pressentation/manger/newest_books_cubit/cubit/newest_books_cubit.dart';
import 'package:books_app/core/app_cubit/cubit/app_manger_cubit.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/bloc_opserver.dart';
import 'package:books_app/core/utils/cache_helper.dart';
import 'package:books_app/core/utils/service_locater.dart';
import 'package:books_app/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//get
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  bool? themeFromShared = CacheHelper.getData(key: 'isDark');

  runApp(BookApp(
    cachedTheme: themeFromShared,
  ));
}

class BookApp extends StatelessWidget {
  final bool? cachedTheme;
  const BookApp({super.key, this.cachedTheme});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => AppMangerCubit()
            ..changeMode(fromShared: cachedTheme)
            ..toggleColor(isDark: cachedTheme!),
        ),
      ],
      child: BlocConsumer<AppMangerCubit, AppMangerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: BlocProvider.of<AppMangerCubit>(context).isDark == false
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,// 
          );
        },
      ),
    );
  }
}
