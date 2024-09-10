import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final String email;
  final String token;

  LoggedIn({required this.email, required this.token});

  @override
  List<Object?> get props => [email, token];
}

class AppStarted extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class OnboardingCompleted extends AuthenticationEvent {}
