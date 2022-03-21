import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginEventEmailChanged extends LoginEvent {
  final String email;
  const LoginEventEmailChanged({this.email});
  @override
  List<Object> get props => [email];
  @override
  String toString() => 'Email Changed: $email';
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;
  const LoginEventPasswordChanged({this.password});
  @override
  List<Object> get props => [password];
  @override
  String toString() => 'Password Changed: $password';
}

class LoginEventWithGooglePressed extends LoginEvent {}

class LoginEventWidthEmailAndPasswordPressed extends LoginEvent {
  final String email;
  final String password;
  const LoginEventWidthEmailAndPasswordPressed({
    @required this.email,
    @required this.password,
  });
  @override
  List<Object> get props => [email, password];
  @override
  String toString() =>
      'LoginEventWithEmailAndPasswordPressed, email = $email, password = $password';
}
