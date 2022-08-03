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
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: ZeeveColors.primary),
          color: ZeeveColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        margin: const EdgeInsets.all(8),
        width: width,
        height: 55,
        child: Row(
          children: [
            CircleAvatar(radius: 26, child: Icon(icon)),
            const SizedBox(width: 10),
            Expanded(child: Text(content))
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(16),
          width: width,
          height: height,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: ZeeveColors.primary,
                    offset: Offset(5, 10),
                    blurRadius: 15,
                  )
                ], shape: BoxShape.circle, color: ZeeveColors.secondary),
                child: const CircleAvatar(
                    foregroundColor: ZeeveColors.secondary,
                    radius: 50,
                    child: Icon(Icons.person, size: 50)),
              ),
              profileTiles("Prakash", Icons.person),
              profileTiles("H", Icons.person),
              profileTiles("prakash.h@zeeve.io", Icons.email),
              profileTiles("Not set", Icons.call),
              profileTiles("Not set", Icons.public)
            ],
          )),
    );
  }
}
