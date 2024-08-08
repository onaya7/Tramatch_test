import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:tramatch_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tramatch_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:tramatch_test/features/auth/domain/usecases/signout_usecase.dart';
import 'package:tramatch_test/features/auth/domain/usecases/signup_usecase.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/domain/usecases/get_currentuser_usecase.dart';
import '../../features/auth/domain/usecases/signin_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

@module
abstract class ServiceModule {
  //Firebase ----------------------------------------------
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  //Navigator ----------------------------------------------
  @lazySingleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  //Blocs ------------------------------------------------
  @lazySingleton
  AuthBloc get authBloc => AuthBloc();

  //DataSources ------------------------------------------
  @lazySingleton
  AuthRemoteDataSource get authRemoteDataSource =>
      AuthRemoteDataSourceImpl(firebaseAuth);

  //Repositories ------------------------------------------
  @lazySingleton
  AuthRepository get authRepository => AuthRepositoryImpl(authRemoteDataSource);

  //UseCases ----------------------------------------------
  @lazySingleton
  SignInWithEmailAndPassword get signInWithEmailAndPassword =>
      SignInWithEmailAndPassword(
        authRepository,
      );
  @lazySingleton
  SignOut get signOut => SignOut(authRepository);

  @lazySingleton
  SignUpWithEmailAndPassword get signUpWithEmailAndPassword =>
      SignUpWithEmailAndPassword(authRepository);

  @lazySingleton
  GetCurrentUser get getCurrentUser => GetCurrentUser(authRepository);
}
