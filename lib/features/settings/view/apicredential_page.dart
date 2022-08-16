import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

class APICredentialPage extends StatefulWidget {
  const APICredentialPage({Key? key}) : super(key: key);

  @override
  State<APICredentialPage> createState() => _APICredentialPageState();
}

class _APICredentialPageState extends State<APICredentialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.vpn_key),
            onPressed: () {},
            label: const Text("Create Key")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: EmptyWidget(
              packageImage: PackageImage.Image_3,
              title: "No data",
            ),
          ),
        ));
  }
}
