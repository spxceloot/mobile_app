import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/bloc/auth/bloc.dart';
import 'package:spxce/bloc/auth/state.dart';
import 'package:spxce/bloc/auth_view_bloc/bloc.dart';
import 'package:spxce/bloc/auth_view_bloc/event.dart';
import 'package:spxce/repository/auth_repository.dart';
import 'package:spxce/view/auth/view.dart';
import 'package:spxce/view/common/loading.dart';
import 'package:spxce/view/home/view.dart';
import 'package:spxce/view/onboarding/view.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationAuthenticated) {
        return const HomeView();
      } else if (state is AuthenticationUnauthenticated) {
        return BlocProvider(
          create: (context) => AuthViewBloc(
            authRepository: AuthRepositoryImpl(),
            authenticationBloc: context.watch<AuthenticationBloc>(),
          )..add(AuthNavEvent(AuthNavOption.signInView)),
          child: const AuthenticationView(),
        );
      } else if (state is AuthenticationLoading) {
        return const LoadingView();
      } else {
        return const OnboardingView();
      }
    });
  }
}
