import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spxce/app_wrapper.dart';
import 'package:spxce/bloc/auth/bloc.dart';
import 'package:spxce/bloc/auth/event.dart';
import 'package:spxce/bloc/location/bloc.dart';
import 'package:spxce/bloc/location/event.dart';
import 'package:spxce/services/secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // load env file
  await dotenv.load(fileName: ".env");

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
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white.withOpacity(0),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        ),
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LocationBloc()..add(GetLocation())),
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
