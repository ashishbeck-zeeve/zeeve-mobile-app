import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:zeeve/features/workspace/provider/provider.dart';
import 'package:zeeve/features/workspace/widgets/resources_body.dart';
import 'package:zeeve/features/workspace/widgets/workspace_body.dart';

/// {@template workspace_page}
/// A description for WorkspacePage
/// {@endtemplate}
class ResourcesPage extends StatelessWidget {
  /// {@macro workspace_page}
  const ResourcesPage({Key? key}) : super(key: key);

  /// The static route for WorkspacePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ResourcesPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkspaceNotifier(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(context, 'Resources'),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.private_connectivity),
              label: "Add Endpoint",
              onTap: () {
                Navigator.push(context, MarketplacePage.route());
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.control_point_duplicate),
              label: "Add Network",
              onTap: () {
                Navigator.push(context, MarketplacePage.route());
              },
            ),
          ],
        ),
        body: const ResourcesView(),
      ),
    );
  }
}

/// {@template workspace_view}
/// Displays the Body of WorkspaceView
/// {@endtemplate}
class ResourcesView extends StatelessWidget {
  /// {@macro workspace_view}
  const ResourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResourcesBody();
  }
}
