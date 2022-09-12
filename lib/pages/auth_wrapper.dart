import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/login/view/login_page.dart';
import 'package:zeeve/pages/home.dart';
import 'package:zeeve/providers/auth.dart';

/// {@template auth_wrapper_page}
/// Shows the login page when no user is logged in
/// else shows the home page
/// {@endtemplate}
class AuthWrapperPage extends StatelessWidget {
  /// {@macro auth_wrapper_page}
  const AuthWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthWrapperNotifier>(
      builder: (context, state, child) {
        if (kDebugMode) print('main wrapper is ${state.authToken}');
        if (state.authToken == null) return const LoginPage();
        return const HomePage();
      },
    );
  }
}
