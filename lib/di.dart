import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skillbox_app/data/api/api_service.dart';
import 'package:skillbox_app/data/data_source/todo_data_source.dart';
import 'package:skillbox_app/data/data_source/user_data_source.dart';
import 'package:skillbox_app/data/repository/todo_repository_impl.dart';
import 'package:skillbox_app/data/repository/user_repsitory_impl.dart';
import 'package:skillbox_app/domain/repository/todo_repository.dart';
import 'package:skillbox_app/domain/repository/user_repository.dart';
import 'package:skillbox_app/domain/use_case/get_todos_usecase.dart';
import 'package:skillbox_app/domain/use_case/get_users_usecase.dart';

final GetIt di = GetIt.instance;

void setupDi() {
  di.registerLazySingleton<Dio>(() => configureDio());
  di.registerLazySingleton<ApiService>(() => ApiService(dio: di()));

  // DATA SOURCE
  di.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl(api: di()));
  di.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl(api: di()));

  // REPOSITORY
  di.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(dataSource: di()));
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(dataSource: di()));

  // USECASE
  di.registerFactory<GetTodosUseCase>(() => GetTodosUseCase(di()));
  di.registerFactory<GetUsersUseCase>(() => GetUsersUseCase(di()));
}

Dio configureDio() {
  final dio = Dio();
  dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  return dio;
}
