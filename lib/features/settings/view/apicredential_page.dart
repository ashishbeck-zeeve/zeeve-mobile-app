import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/settings/view/addapikey_page.dart';

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
    Widget apiListTile() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: ZeeveColors.ternary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account name", style: ZeeveTextStyle.subtitle2),
                  Text("Key Name", style: ZeeveTextStyle.bodyText2),
                  Text("Access key", style: ZeeveTextStyle.subtitle1),
                  Text("**************************",
                      style: ZeeveTextStyle.bodyText2)
                ],
              ),
              Wrap(
                children: const [
                  Icon(Icons.copy),
                  Icon(Icons.delete),
                  Icon(Icons.visibility_off)
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.vpn_key),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddApikeyPage())),
            label: const Text("Create Key")),
        body: SizedBox(
          width: width,
          height: height,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: ((context, index) {
                return apiListTile();
              })),
        ));
  }
}
