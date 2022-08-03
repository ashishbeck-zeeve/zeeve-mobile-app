import 'package:flutter/material.dart';
import 'package:zeeve/features/auth_wrapper/provider/provider.dart';
import 'package:zeeve/features/auth_wrapper/widgets/auth_wrapper_body.dart';

/// {@template auth_wrapper_page}
/// A description for AuthWrapperPage
/// {@endtemplate}
class AuthWrapperPage extends StatelessWidget {
  /// {@macro auth_wrapper_page}
  const AuthWrapperPage({Key? key}) : super(key: key);

  /// The static route for AuthWrapperPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AuthWrapperPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthWrapperNotifier(),
      child: const Scaffold(
        body: AuthWrapperView(),
      ),
    );
  }
}

/// {@template auth_wrapper_view}
/// Displays the Body of AuthWrapperView
/// {@endtemplate}
class AuthWrapperView extends StatelessWidget {
  /// {@macro auth_wrapper_view}
  const AuthWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthWrapperBody();
  }
}
