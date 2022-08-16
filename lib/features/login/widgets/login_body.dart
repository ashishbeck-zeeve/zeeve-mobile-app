import 'package:app_ui/app_ui.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/login/provider/provider.dart';
import 'package:zeeve/features/login/widgets/widgets.dart';
import 'package:zeeve/features/signup/signup.dart';
import 'package:zeeve/providers/auth.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatefulWidget {
  /// {@macro login_body}
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _signIn(LoginNotifier state, AuthWrapperNotifier authWrapper) async {
    var result =
        await state.signIn(_emailController.text, _passwordController.text);
    authWrapper.updateAuthToken(result);
  }

  @override
  Widget build(BuildContext context) {
    var authWrapper = context.read<AuthWrapperNotifier>();
    return Consumer<LoginNotifier>(
      builder: (context, state, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    'Welcome to Zeeve!',
                    style: ZeeveTextStyle.headline2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Login to your account',
                    style: ZeeveTextStyle.bodyText1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFields.emailTextField(_emailController),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFields.passwordTextField(_passwordController,
                      obscurity: false),
                  const SizedBox(
                    height: 16,
                  ),
                  state.isLoading
                      ? const Spinner()
                      : MyButton(
                          text: 'Sign In',
                          onPressed: () {
                            _signIn(state, authWrapper);
                          },
                        ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text.rich(TextSpan(
                      text: "Don't have an account? ",
                      style:
                          ZeeveTextStyle.caption.copyWith(color: Colors.black),
                      children: [
                        WidgetSpan(
                            child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              Navigator.push(context, SignupPage.route()),
                          child: Text(
                            "Sign up now",
                            style: ZeeveTextStyle.caption.copyWith(
                                color: ZeeveColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                      ])),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(
                    height: 16,
                  ),
                  GoogleAuthButton(
                    text: 'Sign up using Google',
                    style: const AuthButtonStyle(
                        margin: EdgeInsets.all(8), padding: EdgeInsets.all(10)
                        // buttonType: AuthButtonType.icon,
                        ),
                    onPressed: () {},
                  ),
                  GithubAuthButton(
                    text: 'Sign up using Github',
                    style: const AuthButtonStyle(
                        margin: EdgeInsets.all(8), padding: EdgeInsets.all(10)
                        // buttonType: AuthButtonType.icon,
                        ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
