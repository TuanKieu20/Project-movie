import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationEventStarted extends AuthenticationEvent {}

class AuthencationEventLoggedIn extends AuthenticationEvent {}

class AuthencationEventLoggedOut extends AuthenticationEvent {}
