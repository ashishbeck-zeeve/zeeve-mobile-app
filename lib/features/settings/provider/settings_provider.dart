import 'package:flutter/foundation.dart';

class SettingsNotifier with ChangeNotifier {
  final int _count = 0;
  int get count => _count;
  String? _cloudName = "";
  String? get cloudName => _cloudName;

  bool _displaytile = false;
  bool get displaytile => _displaytile;

  void updateCloudName(String? newName) {
    _cloudName = newName;
    notifyListeners();
  }

  void updatedisplaytile(bool newval) {
    _displaytile = newval;
    if (kDebugMode) print(_displaytile);
    notifyListeners();
  }
}
