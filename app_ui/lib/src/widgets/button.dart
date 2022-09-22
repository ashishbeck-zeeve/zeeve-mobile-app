// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// {@template button}
/// A custom button
/// {@endtemplate}
class MyButton extends StatelessWidget {
  /// {@macro button}
  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  /// The title of this button
  final String text;

  /// The function to invoke when button is pressed
  final Function() onPressed;

  /// Optional Icon to display
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
    return icon == null
        ? ElevatedButton(
            style: style,
            onPressed: onPressed,
            child: Text(text),
          )
        : ElevatedButton.icon(
            style: style,
            onPressed: onPressed,
            icon: icon!,
            label: Text(text),
          );
  }
}
