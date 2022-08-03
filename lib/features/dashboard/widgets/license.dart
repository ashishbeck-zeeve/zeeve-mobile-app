import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class License extends StatelessWidget {
  /// {@macro dashboard_body}
  const License({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ZeeveColors.primary,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ZeeveColors.white,
                ),
                child: Text(
                  'Zeeve License: Standard',
                  style: ZeeveTextStyle.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
              const ListTile(
                title: Text(
                  'Monthly Subscription',
                  style: TextStyle(color: ZeeveColors.white),
                ),
                leading: Icon(
                  Icons.wallet,
                  color: ZeeveColors.white,
                ),
                trailing:
                    Text('\$0', style: TextStyle(color: ZeeveColors.white)),
              ),
              // const ListTile(
              //   title: Text('Monthly Subscription'),
              //   leading: Icon(Icons.wallet),
              //   trailing: Text('\$0'),
              // ),
            ],
          ),
        );
      },
    );
  }
}
