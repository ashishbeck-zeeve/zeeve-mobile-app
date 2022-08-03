import 'package:flutter/material.dart';

class CommonWidgets {
  CommonWidgets._();

  static AppBar appBar(
    BuildContext context,
    String title, {
    bool showBack = true,
  }) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
    );
  }
}
