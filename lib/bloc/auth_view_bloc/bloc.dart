import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/bloc/auth/bloc.dart';
import 'package:spxce/bloc/auth/event.dart';
import 'package:spxce/bloc/auth_view_bloc/event.dart';
import 'package:spxce/bloc/auth_view_bloc/state.dart';
import 'package:spxce/models/auth_response.dart';
import 'package:spxce/repository/auth_repository.dart';

class AuthViewBloc extends Bloc<AuthViewEvent, AuthViewState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  AuthViewBloc({required this.authRepository, required this.authenticationBloc})
      : super(AuthViewInitial()) {
    on<AuthNavEvent>(_authNav);
    on<SignInButtonPressed>(_signIn);
    on<SignUpButtonPressed>(_signUp);
  }

  _authNav(AuthNavEvent event, Emitter emit) {
    if (event.option == AuthNavOption.signInView) {
      emit(SignInViewState());
    } else {
      emit(SignUpViewState());
    }
  }

  // handle sign in button pressed event
  _signIn(SignInButtonPressed event, Emitter emit) async {
    // emit laoding state
    emit(AuthViewLoadingState());

    try {
      // call signin func from auth repository
      AuthResponse response = await authRepository.signIn(
          email: event.email, password: event.password);

      // add logged in event to
      authenticationBloc
          .add(LoggedIn(email: response.email, token: response.token));
    } catch (e) {
      log(e.toString());

      // emit on sign in failure
      emit(AuthViewFailureState(e.toString()));
    }
  }

  // handle sign up button pressed event
  _signUp(SignUpButtonPressed event, Emitter emit) async {
    // emit laoding state
    emit(AuthViewLoadingState());

    try {
      // call signup func from auth repository
      AuthResponse response = await authRepository.signUp(
          email: event.email,
          password: event.password,
          username: event.username);

      // add logged in event to
      authenticationBloc
          .add(LoggedIn(email: response.email, token: response.token));
    } catch (e) {
      log(e.toString());

      // emit on sign in failure
      emit(AuthViewFailureState(e.toString()));
    }
  }
}
