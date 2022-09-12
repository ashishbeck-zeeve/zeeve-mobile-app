// import 'package:zeeve/features/storage_wrapper/provider/provider.dart';

import 'package:flutter/foundation.dart';

final AuthService authService = AuthService._();

class AuthService {
  AuthService._();

  Future<String> signIn(String email, String password) async {
    if (kDebugMode) print("signing in");
    await Future.delayed(const Duration(milliseconds: 1000));
    if (kDebugMode) print("signed in");
    return "value";
  }

  Future<String> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    if (kDebugMode) print("signing up");
    await Future.delayed(const Duration(milliseconds: 1000));
    if (kDebugMode) print("signed up");
    return "value";
  }

  Future<bool> signOut() async {
    if (kDebugMode) print("signing out");
    await Future.delayed(const Duration(milliseconds: 500));
    if (kDebugMode) print("signed out");
    return true;
  }
}
