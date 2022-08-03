import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NodesTextField extends StatelessWidget {
  const NodesTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        hintText: 'Number of nodes',
        border: OutlineInputBorder(),
      ),
    );
  }
}
