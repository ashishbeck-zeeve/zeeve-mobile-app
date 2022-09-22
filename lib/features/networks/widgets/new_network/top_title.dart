// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final int step;
  const TopTitle({
    Key? key,
    required this.title,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(text: '($step/4) ', children: [
              TextSpan(
                text: title,
                style: ZeeveTextStyle.headline5,
              )
            ]),
            style: ZeeveTextStyle.caption,
          ),
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: ZeeveColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
