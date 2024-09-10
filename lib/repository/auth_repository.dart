import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spxce/exceptions/auth_exceptions.dart';
import 'package:spxce/models/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> signUp({
    required String username,
    required String email,
    required password,
  });

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: "192.168.1.107:3000"));

  @override
  Future<AuthResponse> signUp({
    required String username,
    required String email,
    required password,
  }) async {
    try {
      Response response = await dio.post("/register", data: {
        "username": username,
        "email": email,
        "password": password,
      });

      if (response.statusCode == HttpStatus.ok) {
        String? token = response.headers.value("Authorization");

        if (token == null) {
          throw AuthException("invalid token received from server");
        }

        return AuthResponse(email: email, token: token);
      }

      throw AuthException(response.data);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post("/register", data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == HttpStatus.ok) {
        String? token = response.headers.value("Authorization");

        if (token == null) {
          throw AuthException("invalid token received from server");
        }

        return AuthResponse(email: email, token: token);
      }

      throw AuthException(response.data);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
