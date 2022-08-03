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
  }) : super(key: key);

  /// The title of this button
  final String text;

  /// The function to invoke when button is pressed
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
