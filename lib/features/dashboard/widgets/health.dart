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
  ScrollController scrollController = ScrollController();

  /// {@macro dashboard_body}
  Health({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: Container(
            // padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ZeeveColors.gray,
            ),
            child: ExpansionTile(
              title: Text(
                'System Health',
                style: ZeeveTextStyle.headline6,
              ),
              onExpansionChanged: (val) async {
                if (val) {
                  await Future.delayed(const Duration(milliseconds: 225));
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                }
              },
              children: const [
                // Text(
                //   '',
                //   style: ZeeveTextStyle.headline6,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                ListTile(
                  title: Text('Active Nodes'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.now_widgets,
                    color: ZeeveColors.green,
                  ),
                ),
                ListTile(
                  title: Text('Open Tickets'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.airplane_ticket,
                    color: ZeeveColors.orange,
                  ),
                ),
                ListTile(
                  title: Text('Warnings'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.warning,
                    color: ZeeveColors.orange,
                  ),
                ),
                ListTile(
                  title: Text('Product Installed'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.star,
                    color: ZeeveColors.orange,
                  ),
                ),
                ListTile(
                  title: Text('Inactive Nodes'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.now_widgets,
                    color: ZeeveColors.secondary,
                  ),
                ),
                ListTile(
                  title: Text('Closed Tickets'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.airplane_ticket,
                    color: ZeeveColors.secondary,
                  ),
                ),
                ListTile(
                  title: Text('Fatal Issues'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.warning,
                    color: ZeeveColors.secondary,
                  ),
                ),
                ListTile(
                  title: Text('Pending Invites'),
                  trailing: Text('0'),
                  leading: Icon(
                    Icons.people,
                    color: ZeeveColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
