// import 'package:zeeve/features/storage_wrapper/provider/provider.dart';

final AuthService authService = AuthService._();

class AuthService {
  AuthService._();

  Future<String> signIn(String email, String password) async {
    print("signing in");
    await Future.delayed(const Duration(milliseconds: 1000));
    print("signed in");
    return "value";
  }

  Future<String> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    print("signing up");
    await Future.delayed(const Duration(milliseconds: 1000));
    print("signed up");
    return "value";
  }

  Future<bool> signOut() async {
    print("signing out");
    await Future.delayed(const Duration(milliseconds: 500));
    print("signed out");
    return true;
  }
}
