import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FilesWidgegt extends StatelessWidget {
  const FilesWidgegt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget infoItem(String title, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.all(6),
      width: width,
      padding: const EdgeInsets.all(8),
      // height: height * 0.15,
      decoration: BoxDecoration(
        color: ZeeveColors.ternary,
        border: Border.all(color: ZeeveColors.gray),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: [
        Text(
          'ZDFS / Files',
          style: ZeeveTextStyle.subtitle2.copyWith(color: ZeeveColors.primary),
        ),
        infoItem('Name', 'File'),
        infoItem('CID', 'NA'),
        infoItem('Access Key', '-'),
        infoItem('Status', 'NA'),
        infoItem('More', '-'),
      ]),
    );
  }
}
