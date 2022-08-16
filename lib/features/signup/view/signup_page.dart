import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/signup/provider/provider.dart';
import 'package:zeeve/features/signup/widgets/signup_body.dart';

/// {@template signup_page}
/// A description for SignupPage
/// {@endtemplate}
class SignupPage extends StatelessWidget {
  /// {@macro signup_page}
  const SignupPage({Key? key}) : super(key: key);

  /// The static route for SignupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignupPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupNotifier(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(context, "Sign Up"),
        body: const SignupView(),
      ),
    );
  }
}

/// {@template signup_view}
/// Displays the Body of SignupView
/// {@endtemplate}
class SignupView extends StatelessWidget {
  /// {@macro signup_view}
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupBody();
  }
}
