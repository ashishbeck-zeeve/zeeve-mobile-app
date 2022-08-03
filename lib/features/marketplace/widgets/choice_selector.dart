import 'package:flutter/material.dart';

class ChoiceSelector extends StatefulWidget {
  const ChoiceSelector({
    Key? key,
    required this.options,
    required this.selected,
  }) : super(key: key);
  final List<Widget> options;
  final int selected;

  @override
  State<ChoiceSelector> createState() => _ChoiceSelectorState();
}

class _ChoiceSelectorState extends State<ChoiceSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: widget.options),
    );
  }
}
