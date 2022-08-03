import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

final StorageService storageService = StorageService._();

class StorageService extends ChangeNotifier {
  StorageService._();

  final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  final box = GetStorage();

  final String _pinKey = "pin";
  final String _authTokenKey = "authToken";
  final String _sessionIDKey = "sessionID";

  String? pin;
  String? authToken;
  String? sessionID;

  init() async {
    await Future.wait([
      getPIN(),
      getAuthToken(),
      getSessionID(),
    ]);
  }

  Future getPIN() async {
    pin = await secureStorage.read(key: _pinKey);
  }

  updatePIN(String value) {
    pin = value;
    secureStorage.write(key: _pinKey, value: value);
  }

  Future getAuthToken() async {
    authToken = await secureStorage.read(key: _authTokenKey);
  }

  updateAuthToken(String? value) {
    authToken = value;
    secureStorage.write(key: _authTokenKey, value: value);
  }

  Future getSessionID() async {
    sessionID = await secureStorage.read(key: _sessionIDKey);
  }

  updateSessionID(String? value) {
    sessionID = value;
    secureStorage.write(key: _sessionIDKey, value: value);
  }
}
