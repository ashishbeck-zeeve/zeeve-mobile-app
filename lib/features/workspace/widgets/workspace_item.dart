import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/view/marketplace_page.dart';
import 'package:zeeve/features/workspace/view/resources_page.dart';

class WorkspaceItem extends StatelessWidget {
  const WorkspaceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    Widget actionButton(
      String label,
      IconData iconData,
      Function() onPressed,
    ) {
      return TextButton.icon(
          onPressed: onPressed,
          icon: Icon(iconData),
          label: Text(
            label,
            style: ZeeveTextStyle.caption,
          ));
    }

    Widget actions() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionButton('Edit', Icons.edit, () {}),
          actionButton('Delete', Icons.delete, () {}),
          actionButton('Add Network', Icons.add, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MarketplacePage()));
          }),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, ResourcesPage.route());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        // width: width * 0.45,
        decoration: BoxDecoration(
          border: Border.all(color: ZeeveColors.gray),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Default Workspace',
                style: ZeeveTextStyle.subtitle2
                    .copyWith(color: ZeeveColors.primary),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: ZeeveColors.primary,
              )
            ],
          ),
          infoItem('Networks', '0'),
          infoItem('Nodes', '0'),
          infoItem('Endpoints', '0'),
          infoItem('Members', '1'),
          actions(),
        ]),
      ),
    );
  }
}
