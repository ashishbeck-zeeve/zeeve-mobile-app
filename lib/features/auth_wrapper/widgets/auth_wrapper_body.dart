import 'package:flutter/material.dart';
import 'package:zeeve/features/auth_wrapper/provider/provider.dart';
import 'package:zeeve/features/login/view/login_page.dart';
import 'package:zeeve/pages/home.dart';

/// {@template auth_wrapper_body}
/// Body of the AuthWrapperPage.
///
/// Add what it does
/// {@endtemplate}
class AuthWrapperBody extends StatelessWidget {
  /// {@macro auth_wrapper_body}
  const AuthWrapperBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthWrapperNotifier>(
      builder: (context, state, child) {
        print('main wrapper is ${state.authToken}');
        if (state.authToken == null) return const LoginPage();
        return const HomePage();
      },
    );
  }
}
