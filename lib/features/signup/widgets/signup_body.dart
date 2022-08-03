import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/login/login.dart';
import 'package:zeeve/features/signup/provider/provider.dart';
import 'package:zeeve/providers/auth.dart';

/// {@template signup_body}
/// Body of the SignupPage.
///
/// Add what it does
/// {@endtemplate}
class SignupBody extends StatefulWidget {
  /// {@macro signup_body}
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _signUp(SignupNotifier state, AuthWrapperNotifier authWrapper) async {
    var result = await state.signUp(
      _emailController.text,
      _passwordController.text,
      _firstController.text,
      _lastController.text,
    );
    print(result);
    authWrapper.updateAuthToken(result);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var authWrapper = context.watch<AuthWrapperNotifier>();
    return Consumer<SignupNotifier>(
      builder: (context, state, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    'Create an account',
                    style: ZeeveTextStyle.headline2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFields.nameTextField(_firstController),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFields.nameTextField(_lastController, isFirst: false),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFields.emailTextField(_emailController),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFields.passwordTextField(_passwordController,
                      obscurity: false),
                  const SizedBox(
                    height: 8,
                  ),
                  state.isLoading
                      ? const Spinner()
                      : MyButton(
                          text: 'Sign Up',
                          onPressed: () {
                            _signUp(state, authWrapper);
                          },
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
