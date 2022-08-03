import 'package:flutter/material.dart';
import 'package:zeeve/services/auth_service.dart';

class SignupNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    _isLoading = true;
    notifyListeners();
    var result = await authService.signUp(email, password, firstName, lastName);
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
