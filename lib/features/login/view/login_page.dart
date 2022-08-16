import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/login/provider/provider.dart';
import 'package:zeeve/features/login/widgets/login_body.dart';

/// {@template login_page}
/// A description for LoginPage
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({Key? key}) : super(key: key);

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(context, "Sign In", showBack: false),
        body: const LoginView(),
      ),
    );
  }
}

/// {@template login_view}
/// Displays the Body of LoginView
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
