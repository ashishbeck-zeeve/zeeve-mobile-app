import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class APICredentialPage extends StatefulWidget {
  const APICredentialPage({Key? key}) : super(key: key);

  @override
  State<APICredentialPage> createState() => _APICredentialPageState();
}

class _APICredentialPageState extends State<APICredentialPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.vpn_key),
          onPressed: () {},
          label: const Text("Create Key")),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: width,
        height: height,
        child: Column(
          children: const [
            Expanded(child: Center(child: Text("No Data"))),
            // CommonWidgets.commonButton(context, "Create Key",
            //     icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
