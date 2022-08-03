import 'package:flutter/material.dart';
import 'package:zeeve/services/storage_service.dart';

class AuthWrapperNotifier with ChangeNotifier {
  String? _pin = storageService.pin;
  String? get pin => _pin;
  String? _authToken = storageService.authToken;
  String? get authToken => _authToken;
  String? _sessionID = storageService.sessionID;
  String? get sessionID => _sessionID;

  void updatePIN(String value) {
    _pin = value;
    storageService.updatePIN(value);
    notifyListeners();
  }

  void updateAuthToken(String? value) {
    _authToken = value;
    storageService.updateAuthToken(value);
    notifyListeners();
  }

  void updateSessionID(String? value) {
    _sessionID = value;
    storageService.updateSessionID(value);
    notifyListeners();
  }
}
