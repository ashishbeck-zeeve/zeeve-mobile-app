import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/dashboard/widgets/health.dart';
import 'package:zeeve/features/dashboard/widgets/license.dart';
import 'package:zeeve/features/dashboard/widgets/nodes.dart';
import 'package:zeeve/features/dashboard/widgets/summary.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class DashboardBody extends StatelessWidget {
  /// {@macro dashboard_body}
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const License(),
      const Nodes(),
      const Summary(),
      const Health(),
    ];
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              }),
        );
      },
    );
  }
}
