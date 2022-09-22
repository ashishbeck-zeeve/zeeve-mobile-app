import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Basic prompts like snackbar, dialog, etc
class Prompts {
  Prompts._();

  /// A basic dialog to get user's response on confirming an action
  static Future<bool> questionDialog(BuildContext context,
      {String? title, Widget? content}) async {
    final dialog = AlertDialog(
      title: Text(title ?? ''),
      content: content,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Yes'),
        ),
      ],
    );
    final result = await showDialog<bool>(
      context: context,
      useRootNavigator: false,
      builder: (context) => dialog,
    );
    return result ?? false;
  }

  /// Generic SnackBar
  static void showSnack(BuildContext context, String text, {int duration = 2}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: ZeeveColors.black),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: ZeeveColors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
