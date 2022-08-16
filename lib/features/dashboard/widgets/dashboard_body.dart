import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/dashboard/widgets/chart.dart';
import 'package:zeeve/features/dashboard/widgets/health.dart';
import 'package:zeeve/features/dashboard/widgets/license.dart';
import 'package:zeeve/features/dashboard/widgets/nodes.dart';
import 'package:zeeve/features/dashboard/widgets/summary.dart';
import 'package:zeeve/models/drawer_page.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class DashboardBody extends StatelessWidget {
  /// {@macro dashboard_body}
  DashboardBody({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const License(),
      const Nodes(),
      const Chart(),
      Summary(
        scrollController: scrollController,
      ),
      Health(
        scrollController: scrollController,
      ),
      const SizedBox(
        height: 16,
      ),
    ];
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView.builder(
              controller: scrollController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              }),
        );
      },
    );
  }
}
