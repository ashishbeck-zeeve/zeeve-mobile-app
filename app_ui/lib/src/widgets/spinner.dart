import 'package:flutter/material.dart';

/// {@template spinner}
/// A custom spinner
/// {@endtemplate}
class Spinner extends StatelessWidget {
  /// {@macro spinner}
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
