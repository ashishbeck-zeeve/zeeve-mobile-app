import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const Empty({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmptyWidget(
        packageImage: PackageImage.Image_2,
        title: title,
        subTitle: subtitle,
      ),
    );
  }
}
