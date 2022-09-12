import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/providers/auth.dart';

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
              currentAccountPicture: CircleAvatar(
                backgroundColor: ZeeveColors.secondary,
                child: Text('JD'),
              ),
              decoration: BoxDecoration(color: ZeeveColors.primary),
            ),
            const Spacer(),
            ...drawerPages ?? [],
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                final AuthWrapperNotifier notifier =
                    context.read<AuthWrapperNotifier>();
                notifier.updateAuthToken(null);
              },
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
