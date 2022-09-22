import 'dart:math';

import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/utils/input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Miscellaneous fields for default texts, numbers, drop-down lists, etc
class InputFields {
  InputFields._();

  /// Email text field with appropriate validation
  static Widget emailTextField(
    TextEditingController controller, {
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: ZeeveTextStyle.subtitle1),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          focusNode: thisFocus,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: 'your.email@gmail.com',
            border: OutlineInputBorder(),
          ),
          validator: (val) {
            const pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            final regex = RegExp(pattern);
            if (!regex.hasMatch(val!)) {
              return 'Enter Valid Email';
            } else {
              return null;
            }
          },
          onFieldSubmitted: (val) {
            nextFocus?.requestFocus();
          },
        ),
      ],
    );
  }

  /// Password text field
  static Widget passwordTextField(
    TextEditingController controller, {
    required bool obscurity,
    bool isConfirm = false,
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isConfirm ? 'Confirm Password' : 'Password',
            style: ZeeveTextStyle.subtitle1,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            focusNode: thisFocus,
            obscureText: obscurity,
            keyboardType: TextInputType.visiblePassword,
            // textInputAction:
            //     isPhoneMode ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                hintText: isConfirm ? 'Confirm Password' : 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon:
                      Icon(obscurity ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => obscurity = !obscurity),
                )),
            validator: (val) => controller.text.isEmpty
                ? 'Please enter a password'
                : controller.text.length < 8
                    ? 'The password should be 8 characters long'
                    : null,
            onFieldSubmitted: (val) {
              nextFocus?.requestFocus();
            },
          ),
        ],
      );
    });
  }

  /// Specialised text field for name inputs
  static Widget nameTextField(
    TextEditingController controller, {
    bool isFirst = true,
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${isFirst ? 'First ' : 'Last '} Name',
          style: ZeeveTextStyle.subtitle1,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          focusNode: thisFocus,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: '${isFirst ? 'First ' : 'Last '} Name',
            border: const OutlineInputBorder(),
          ),
          validator: (val) =>
              val!.isNotEmpty ? null : 'Please provide at least the first name',
          maxLength: 20,
          inputFormatters: InputFormatters.wordsAndSpacesFilter(),
          onFieldSubmitted: (val) {
            nextFocus?.requestFocus();
          },
        ),
      ],
    );
  }

  /// Text field for general purposes
  static Widget genericTextField({
    required String title,
    String? initialValue,
    TextEditingController? controller,
    bool? obscurity,
    Function(String? value)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(title, style: ZeeveTextStyle.subtitle2),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          focusNode: thisFocus,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: title,
          ),
          validator: (val) => val!.isNotEmpty ? null : 'This cannot be empty',
          onChanged: onChanged,
          obscureText: obscurity ?? false,
          inputFormatters: inputFormatters,
          // maxLength: 20,
          onFieldSubmitted: (val) {
            nextFocus?.requestFocus();
          },
        ),
      ],
    );
  }

  /// Number text field with increment and decrement buttons
  static Widget numberTextField({
    required String title,
    String? initialValue,
    TextEditingController? controller,
    Function(String? value)? onChanged,
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    final fallbackController =
        controller ?? TextEditingController(text: initialValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(title, style: ZeeveTextStyle.subtitle2),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              onPressed: () {
                fallbackController.text =
                    (max(0, int.parse(fallbackController.text) - 1)).toString();
                onChanged!(fallbackController.text);
              },
              icon: const Icon(Icons.remove),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  controller: fallbackController,
                  focusNode: thisFocus,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  // showCursor: false,
                  decoration: InputDecoration(
                    hintText: title,
                  ),
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'This cannot be empty',
                  onChanged: onChanged,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onFieldSubmitted: (val) {
                    nextFocus?.requestFocus();
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                fallbackController.text =
                    (int.parse(fallbackController.text) + 1).toString();
                onChanged!(fallbackController.text);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  /// A simple drop-down field
  static Widget dropDown({
    required String title,
    String? value,
    required List<String> options,
    required Function(String? value) onChanged,
  }) {
    final items = options
        .map(
          (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(title, style: ZeeveTextStyle.subtitle2),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: options.contains(value) ? value : null,
          hint: Text('Select $title'),
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
