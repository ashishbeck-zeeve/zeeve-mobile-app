import 'package:flutter/material.dart';
import 'package:zeeve/features/signup/provider/provider.dart';

/// {@template signup_body}
/// Body of the SignupPage.
///
/// Add what it does
/// {@endtemplate}
class SignupBody extends StatelessWidget {
  /// {@macro signup_body}
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupNotifier>(
      builder: (context, state, child) {
        return Text(state.count.toString());
      },
    );
  }
}
