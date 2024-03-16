part of 'auth_bloc.dart';

@immutable
class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String message;

  LoginSuccess(this.message);
}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure(this.message);
}

//--- SignUp
class SginUpLoading extends AuthState {}

class SginUpFailure extends AuthState {
  final String message;

  SginUpFailure(this.message);
}

class SginUpSuccess extends AuthState {
  final String message;

  SginUpSuccess(this.message);
}
