import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tramatch_test/features/task/presentation/bloc/task_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //Navigator key
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());

  // //DioClient

  // //HomeDataSource
  // getIt.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSourceImpl(getIt<ApiClient>()));

  // //HomeRepository
  // getIt.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()));

  //HomeBloc
  getIt.registerLazySingleton<AuthBloc>(() => AuthBloc());

  //TaskBloc
  getIt.registerLazySingleton<TaskBloc>(() => TaskBloc());

  // //UseCases ----------------------------------------------
  // getIt
  //     .registerLazySingleton<GetPosts>(() => GetPosts(getIt<HomeRepository>()));
  // getIt.registerLazySingleton<CreatePost>(
  //     () => CreatePost(getIt<HomeRepository>()));
  // getIt.registerLazySingleton<UpdatePost>(
  //     () => UpdatePost(getIt<HomeRepository>()));
  // getIt.registerLazySingleton<DeletePost>(
  //     () => DeletePost(getIt<HomeRepository>()));
}
