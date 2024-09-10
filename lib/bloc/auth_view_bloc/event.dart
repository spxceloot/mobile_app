import 'package:equatable/equatable.dart';

enum AuthNavOption { signUpView, signInView }

class AuthViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthNavEvent extends AuthViewEvent {
  final AuthNavOption option;

  AuthNavEvent(this.option);

  @override
  List<Object?> get props => [option];
}

class SignInButtonPressed extends AuthViewEvent {
  final String email;
  final String password;

  SignInButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignUpButtonPressed extends AuthViewEvent {
  final String email;
  final String password;
  final String username;

  SignUpButtonPressed({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [email, password, username];
}
