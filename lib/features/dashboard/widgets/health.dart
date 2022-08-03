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
class Health extends StatelessWidget {
  /// {@macro dashboard_body}
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ZeeveColors.gray,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'System Health',
                style: ZeeveTextStyle.headline6,
              ),
              const SizedBox(
                height: 16,
              ),
              const ListTile(
                title: Text('Active Nodes'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.now_widgets,
                  color: ZeeveColors.green,
                ),
              ),
              const ListTile(
                title: Text('Open Tickets'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.airplane_ticket,
                  color: ZeeveColors.orange,
                ),
              ),
              const ListTile(
                title: Text('Warnings'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.warning,
                  color: ZeeveColors.orange,
                ),
              ),
              const ListTile(
                title: Text('Product Installed'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.star,
                  color: ZeeveColors.orange,
                ),
              ),
              const ListTile(
                title: Text('Inactive Nodes'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.now_widgets,
                  color: ZeeveColors.secondary,
                ),
              ),
              const ListTile(
                title: Text('Closed Tickets'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.airplane_ticket,
                  color: ZeeveColors.secondary,
                ),
              ),
              const ListTile(
                title: Text('Fatal Issues'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.warning,
                  color: ZeeveColors.secondary,
                ),
              ),
              const ListTile(
                title: Text('Pending Invites'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.people,
                  color: ZeeveColors.secondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
