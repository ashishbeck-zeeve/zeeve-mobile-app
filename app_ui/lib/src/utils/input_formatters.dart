import 'package:flutter/services.dart';

class InputFormatters {
  InputFormatters._();

  static List<TextInputFormatter> amountFilter() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
      TextInputFormatter.withFunction((oldValue, newValue) {
        try {
          final text = newValue.text;
          if (text.isNotEmpty && text != ".") double.parse(text);
          return newValue;
        } catch (e) {}
        return oldValue;
      }),
    ];
  }

  static List<TextInputFormatter> wordsAndSpacesFilter() {
    return [
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
    ];
  }
}
