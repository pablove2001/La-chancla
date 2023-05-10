part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class VerifyAuthEvent extends AuthEvent {}

class AnonymousAuthEvent extends AuthEvent {}

class GoogleAuthEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String full_name;

  SignUpEvent(
      {required this.email, required this.password, required this.full_name});
}

class UserPassAuthEvent extends AuthEvent {
  final String email;
  final String password;

  UserPassAuthEvent({required this.email, required this.password});
}
