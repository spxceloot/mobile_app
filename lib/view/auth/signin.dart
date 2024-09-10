import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/bloc/auth_view_bloc/bloc.dart';
import 'package:spxce/bloc/auth_view_bloc/event.dart';
import 'package:spxce/view/auth/auth_button.dart';
import 'package:spxce/view/auth/custom_textform_field.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // email textform field
        CustomTextFormField(
          hintText: "Email",
          obscured: false,
          controller: _emailController,
        ),

        const SizedBox(
          height: 12.0,
        ),

        // password text form field
        CustomTextFormField(
          hintText: "Password",
          obscured: true,
          controller: _passwordController,
        ),

        const SizedBox(
          height: 20.0,
        ),

        // sign up button
        AuthButton(
          label: "Sign in",
          onPressed: () {
            BlocProvider.of<AuthViewBloc>(context).add(SignInButtonPressed(
              email: _emailController.text,
              password: _passwordController.text,
            ));
          },
        )
      ],
    );
  }
}
