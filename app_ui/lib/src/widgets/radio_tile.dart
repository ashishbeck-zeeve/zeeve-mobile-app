// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MyRadioTile extends StatelessWidget {
  final String title;
  final String groupValue;
  final Function(String? value) onChanged;
  const MyRadioTile({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: ZeeveTextStyle.subtitle2.copyWith(
          color: title == groupValue ? ZeeveColors.primary : null,
        ),
      ),
      value: title,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
