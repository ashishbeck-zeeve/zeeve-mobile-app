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
class Summary extends StatelessWidget {
  /// {@macro dashboard_body}
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Consumer<DashboardNotifier>(
        builder: (context, state, child) {
          return Container(
            // padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ZeeveColors.gray,
            ),
            child: ExpansionTile(
              title: Text(
                'Summary',
                style: ZeeveTextStyle.headline6,
              ),
              children: const [
                ListTile(
                  title: Text('Workspaces'),
                  leading: Icon(Icons.laptop, color: ZeeveColors.primary),
                  trailing: Text('2'),
                ),
                ListTile(
                  title: Text('Networks'),
                  leading: Icon(Icons.pie_chart, color: ZeeveColors.primary),
                  trailing: Text('0'),
                ),
                ListTile(
                  title: Text('Nodes'),
                  leading: Icon(Icons.now_widgets, color: ZeeveColors.primary),
                  trailing: Text('0'),
                ),
                ListTile(
                  title: Text('Endpoints'),
                  leading: Icon(Icons.polyline, color: ZeeveColors.primary),
                  trailing: Text('0'),
                ),
                ListTile(
                  title: Text('Clouds'),
                  leading: Icon(Icons.cloud, color: ZeeveColors.primary),
                  trailing: Text('0'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
