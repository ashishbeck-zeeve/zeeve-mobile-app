import 'package:flutter/material.dart';

class MarketplaceNotifier with ChangeNotifier {
  int? _cloudValue;
  int? get cloudValue => _cloudValue;

  String? _cloudProvidersValue;
  String? get cloudProvidersValue => _cloudProvidersValue;

  int? _nodeValue;
  int? get nodeValue => _nodeValue;

  updateCloudValue(int value) {
    _cloudValue = value;
    notifyListeners();
  }

  updateCloudProvidersValue(String value) {
    _cloudProvidersValue = value;
    notifyListeners();
  }

  updateNodeValue(int value) {
    _nodeValue = value;
    notifyListeners();
  }
}
