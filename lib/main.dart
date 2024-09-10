import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/app_wrapper.dart';
import 'package:spxce/bloc/auth/bloc.dart';
import 'package:spxce/bloc/auth/event.dart';
import 'package:spxce/services/secure_storage.dart';

void main() {
  runApp(const Spxce());
}

class Spxce extends StatelessWidget {
  const Spxce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(SecureStorage())
            ..add(
              AppStarted(),
            ),
        ),
      ], child: const AppWrapper()),
    );
  }
}
