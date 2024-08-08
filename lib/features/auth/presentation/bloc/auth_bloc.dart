import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection/sl.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_currentuser_usecase.dart';
import '../../domain/usecases/signin_usecase.dart';
import '../../domain/usecases/signout_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(signInEvent);
    on<SignOutEvent>(signOutEvent);
    on<SignUpEvent>(signUpEvent);
    on<CheckAuthEvent>(checkAuthEvent);
  }

  FutureOr<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    SignInWithEmailAndPassword signInWithEmailAndPassword =
        getIt.call<SignInWithEmailAndPassword>();
    final failureOrUser = await signInWithEmailAndPassword(
        SigninParams(email: event.email, password: event.password));
    failureOrUser.fold(
      (failure) => emit(AuthError(message: failure.displayMessage)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  FutureOr<void> signOutEvent(
      SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final signOut = getIt.call<SignOut>();
    final failureOrVoid = await signOut(NoParams());
    failureOrVoid.fold(
      (failure) => emit(AuthError(message: failure.displayMessage)),
      (_) => emit(const AuthUnauthenticated(message: 'User signed out')),
    );
  }

  FutureOr<void> signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final signUpWithEmailAndPassword = getIt.call<SignUpWithEmailAndPassword>();
    final failureOrUser = await signUpWithEmailAndPassword(
        Params(email: event.email, password: event.password));
    failureOrUser.fold(
      (failure) => emit(AuthError(message: failure.displayMessage)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  FutureOr<void> checkAuthEvent(CheckAuthEvent event, Emitter<AuthState> emit) {
    on<CheckAuthEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final getCurrentUser = getIt.call<GetCurrentUser>();
        final failureOrUser = await getCurrentUser(NoParams());
        failureOrUser.fold(
          (failure) =>
              emit(AuthUnauthenticated(message: failure.displayMessage)),
          (user) => emit(AuthAuthenticated(user: user)),
        );
      },
    );
  }
}



// on<SignInEvent>((event, emit) async {
//       emit(AuthLoading());
//       final failureOrUser = await signInWithEmailAndPassword(
//           SigninParams(email: event.email, password: event.password));
//       failureOrUser.fold(
//         (failure) => emit(AuthError(message: failure.message)),
//         (user) => emit(AuthAuthenticated(user: user)),
//       );
//     });

//     on<SignOutEvent>((event, emit) async {
//       emit(AuthLoading());
//       final failureOrVoid = await signOut(NoParams());
//       failureOrVoid.fold(
//         (failure) => emit(AuthError(message: failure.message)),
//         (_) => emit(AuthUnauthenticated()),
//       );
//     });

//     on<SignUpEvent>((event, emit) async {
//       emit(AuthLoading());
//       final failureOrUser = await signUpWithEmailAndPassword(
//           Params(email: event.email, password: event.password));
//       failureOrUser.fold(
//         (failure) => emit(AuthError(message: failure.message)),
//         (user) => emit(AuthAuthenticated(user: user)),
//       );
//     });

//     on<CheckAuthEvent>((event, emit) async {
//       emit(AuthLoading());
//       final failureOrUser = await getCurrentUser(NoParams());
//       failureOrUser.fold(
//         (failure) => emit(AuthUnauthenticated()),
//         (user) => emit(AuthAuthenticated(user: user)),
//       );
//     });