import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNetworkItem extends StatelessWidget {
  final String imgPath;
  final String text1;
  final String text2;
  final String text3;
  final int availableNodes;
  final int totalNodes;
  const AddNetworkItem({
    Key? key,
    required this.imgPath,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.availableNodes,
    required this.totalNodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: ZeeveConstants.radius,
      ),
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          // decoration: BoxDecoration(
          // color: ZeeveColors.primary,
          // borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          // border: Border.all()
          // border: Border.all(color: ZeeveColors.secondary),
          // ),
          // width: 180,
          // height: 180,
          constraints: const BoxConstraints(minHeight: 180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                imgPath,
                width: 175,
              ),
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.bubble_chart)),
                TextSpan(text: text1)
              ])),
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.bubble_chart)),
                TextSpan(text: text2)
              ])),
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.bubble_chart)),
                TextSpan(text: text3)
              ])),
              const Divider(),
              Text(
                "Available: $availableNodes/$totalNodes Nodes",
                style: ZeeveTextStyle.caption,
              )
            ],
          )),
    );
  }
}
