import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget profileTiles(String content, IconData icon) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          readOnly: true,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: content,
            border: const OutlineInputBorder(),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(12),
          width: width,
          height: height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                        backgroundColor: ZeeveColors.ternary,
                        radius: 50,
                        child: Icon(Icons.person,
                            size: 50, color: ZeeveColors.primary)),
                    Text("Zeeve Profile",
                        style: ZeeveTextStyle.headline3
                            .copyWith(color: ZeeveColors.charcoal))
                  ],
                ),
              ),
              profileTiles("First Name", Icons.person),
              profileTiles("Last Name", Icons.person),
              profileTiles("xyz@gmail.com", Icons.email),
              profileTiles("Not set", Icons.call),
              profileTiles("Not set", Icons.public)
            ],
          )),
    );
  }
}
