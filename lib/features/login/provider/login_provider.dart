import 'package:flutter/material.dart';
import 'package:zeeve/services/auth_service.dart';

class LoginNotifier with ChangeNotifier {
  String? _authToken;
  String? get authToken => _authToken;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    var result = await authService.signIn(email, password);
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
