import 'package:books_app/Features/home/data/repos/home_repo_implement.dart';
import 'package:books_app/Features/search/data/repos/search_repo_implemt.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplemnt>(
    SearchRepoImplemnt(
      getIt.get<ApiService>(),
    ),
  );
}
