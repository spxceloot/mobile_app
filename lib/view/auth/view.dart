import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spxce/bloc/auth_view_bloc/bloc.dart';
import 'package:spxce/bloc/auth_view_bloc/state.dart';
import 'package:spxce/view/auth/signin.dart';
import 'package:spxce/view/auth/signup.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthViewBloc, AuthViewState>(
        builder: (context, state) {
          if (state is AuthViewLoadingState) {
            return const AuthLoadingView();
          } else if (state is SignInViewState) {
            return SingleChildScrollView(
              child: SignInView(),
            );
          } else {
            return SingleChildScrollView(
              child: SignUpView(),
            );
          }
        },
      ),
    );
  }
}

class AuthLoadingView extends StatelessWidget {
  const AuthLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCube(
        color: Colors.indigo,
        size: 50.0,
      ),
    );
  }
}
