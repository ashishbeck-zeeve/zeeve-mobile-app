import 'package:flutter/material.dart';
import 'package:zeeve/core/constants.dart';
import 'package:zeeve/models/new_network_params.dart';

class NetworksNotifier with ChangeNotifier {
  final _pageController = PageController();
  PageController get pageController => _pageController;

  NewNetworkParams _params = NewNetworkParams.empty();
  NewNetworkParams get params => _params;

  void nextPage() async {
    await _pageController.nextPage(duration: kPageDuration, curve: kPageCurve);
    notifyListeners();
  }

  void previousPage() async {
    await _pageController.previousPage(
        duration: kPageDuration, curve: kPageCurve);
    notifyListeners();
  }
}
