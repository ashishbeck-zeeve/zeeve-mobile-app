import 'package:app_ui/app_ui.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(6.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications',
                      style: ZeeveTextStyle.headline5
                          .copyWith(color: ZeeveColors.primary)),
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
              // const ListTile(
              //   leading: Icon(Icons.cleaning_services),
              //   title: Text('No new notification'),
              // ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: EmptyWidget(
                  packageImage: PackageImage.Image_2,
                  subTitle: "No new notifications",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
