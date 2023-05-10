import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lachancla/services/bloc/user_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserAuthRepository _authRepo = UserAuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<VerifyAuthEvent>(_authVerification);
    on<GoogleAuthEvent>(_authGoogle);
    on<UserPassAuthEvent>(_authUserPass);
    on<SignUpEvent>(_signUp);
    on<SignOutEvent>(_signOut);
  }

  FutureOr<void> _authVerification(event, emit) {
    emit(AuthLoadingState());
    if (_authRepo.isAlreadyAuthenticated()) {
      emit(AuthSuccessState());
    } else {
      emit(UnAuthState());
    }
  }

  FutureOr<void> _authUserPass(UserPassAuthEvent event, emit) async {
    final email = event.email;
    final password = event.password;

    emit(AuthLoadingState());
    try {
      String result = await _authRepo.signInUserPassword(email, password);
      if (result == "success") {
        emit(AuthSuccessState());
      } else if (result == "invalid-credentials") {
        emit(InvalidCredentialsState());
      } else if (result == "user-not-found") {
        emit(UserNotFoundState());
      } else if (result == "wrong-password") {
        emit(WrongPasswordState());
      }
    } catch (e) {
      emit(AuthErrorState(eMsg: "Ha ocurrido un error en login con Google."));
    }
  }

  FutureOr<void> _signUp(SignUpEvent event, emit) async {
    emit(AuthLoadingState());
    try {
      await _authRepo.signUpUserWithPass(
          event.email, event.password, event.full_name);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(eMsg: "Ha ocurrido un error en login"));
    }
  }

  FutureOr<void> _authGoogle(event, emit) async {
    emit(AuthLoadingState());
    try {
      await _authRepo.signInWithGoogle();
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(eMsg: "Ha ocurrido un error en login con Google."));
    }
  }

  FutureOr<void> _signOut(event, emit) async {
    await _authRepo.signOutFirebaseUser();
    await _authRepo.signOutGoogleUser();

    emit(SignOutSuccessState());
  }
}
