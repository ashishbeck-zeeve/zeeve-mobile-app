import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/providers/auth.dart';

/// {@template drawer}
/// A custom drawer
/// {@endtemplate}
class Notifications extends StatelessWidget {
  /// {@macro drawer}
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ZeeveColors.transparent,
      child: SafeArea(
        child: Container(
          color: ZeeveColors.white,
          padding: const EdgeInsets.all(4),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: ZeeveTextStyle.headline2,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: ZeeveColors.primary,
                    ),
                  )
                ],
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.cleaning_services),
                title: Text('No new notification'),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
