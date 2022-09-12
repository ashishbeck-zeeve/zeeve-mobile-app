import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class Artifacts extends StatefulWidget {
  const Artifacts({Key? key}) : super(key: key);

  @override
  State<Artifacts> createState() => _ArtifactsState();
}

class _ArtifactsState extends State<Artifacts> {
  @override
  Widget build(BuildContext context) {
    Widget item(String title) {
      return Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: ZeeveTextStyle.bodyText2,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download,
                  color: ZeeveColors.primary,
                ))
          ],
        ),
      );
    }

    return ListView(
      children: [
        item('Crypto Artifact'),
        const Divider(),
        item('Connection Profile'),
      ],
    );
  }
}
