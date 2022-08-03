import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/core/utils/input_formatters.dart';

class TextFields {
  TextFields._();

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

  static Widget nameTextField(
    TextEditingController controller, {
    bool isFirst = true,
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${isFirst ? 'First ' : 'Last '} Name',
            style: ZeeveTextStyle.subtitle1),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          focusNode: thisFocus,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: '${isFirst ? 'First ' : 'Last '} Name',
            border: const OutlineInputBorder(),
          ),
          validator: (val) =>
              val!.isNotEmpty ? null : "Please provide at least the first name",
          maxLength: 20,
          inputFormatters: InputFormatters.wordsAndSpacesFilter(),
          onFieldSubmitted: (val) {
            nextFocus?.requestFocus();
          },
        ),
      ],
    );
  }
}
