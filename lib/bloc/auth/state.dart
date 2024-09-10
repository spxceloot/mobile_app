import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class OnboardingState extends AuthenticationState {}
