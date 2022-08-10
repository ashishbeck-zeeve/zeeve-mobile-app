import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template drawer}
/// A custom drawer
/// {@endtemplate}
class MyDrawer extends StatelessWidget {
  /// {@macro drawer}
  const MyDrawer({
    Key? key,
    this.drawerPages,
  }) : super(key: key);
  final List<Widget>? drawerPages;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ZeeveColors.primary, Colors.white],
                stops: [0.1, 0])),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john@doe.com'),
              currentAccountPicture: CircleAvatar(child: Text('JD')),
              decoration: BoxDecoration(color: ZeeveColors.primary),
            ),
            const Spacer(),
            ...drawerPages ?? [],
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
