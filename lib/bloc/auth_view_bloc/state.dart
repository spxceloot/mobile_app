import 'package:equatable/equatable.dart';

class AuthViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthViewInitial extends AuthViewState {}

class SignInViewState extends AuthViewState {}

class SignUpViewState extends AuthViewState {}

class AuthViewLoadingState extends AuthViewState {}

class AuthViewFailureState extends AuthViewState {
  final String message;

  AuthViewFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
