import 'package:flutter/material.dart';
import 'package:zeeve/features/login/provider/provider.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, state, child) {
        return Center(child: Text(state.count.toString()));
      },
    );
  }
}
