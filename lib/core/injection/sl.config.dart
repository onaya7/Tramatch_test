// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter/widgets.dart' as _i718;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/get_currentuser_usecase.dart'
    as _i627;
import '../../features/auth/domain/usecases/signin_usecase.dart' as _i435;
import '../../features/auth/domain/usecases/signout_usecase.dart' as _i611;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import 'service_module.dart' as _i180;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => serviceModule.firebaseAuth);
    gh.lazySingleton<_i718.GlobalKey<_i718.NavigatorState>>(
        () => serviceModule.navigatorKey);
    gh.lazySingleton<_i797.AuthBloc>(() => serviceModule.authBloc);
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
        () => serviceModule.authRemoteDataSource);
    gh.lazySingleton<_i787.AuthRepository>(() => serviceModule.authRepository);
    gh.lazySingleton<_i435.SignInWithEmailAndPassword>(
        () => serviceModule.signInWithEmailAndPassword);
    gh.lazySingleton<_i611.SignOut>(() => serviceModule.signOut);
    gh.lazySingleton<_i57.SignUpWithEmailAndPassword>(
        () => serviceModule.signUpWithEmailAndPassword);
    gh.lazySingleton<_i627.GetCurrentUser>(() => serviceModule.getCurrentUser);
    return this;
  }
}

class _$ServiceModule extends _i180.ServiceModule {}
