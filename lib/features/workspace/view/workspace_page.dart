import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/workspace/provider/provider.dart';
import 'package:zeeve/features/workspace/widgets/workspace_body.dart';

/// {@template workspace_page}
/// A description for WorkspacePage
/// {@endtemplate}
class WorkspacePage extends StatelessWidget {
  /// {@macro workspace_page}
  const WorkspacePage({Key? key}) : super(key: key);

  /// The static route for WorkspacePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const WorkspacePage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkspaceNotifier(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(context, 'Workspace'),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Add Workspace'),
          icon: const Icon(Icons.add),
        ),
        body: const WorkspaceView(),
      ),
    );
  }
}

/// {@template workspace_view}
/// Displays the Body of WorkspaceView
/// {@endtemplate}
class WorkspaceView extends StatelessWidget {
  /// {@macro workspace_view}
  const WorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WorkspaceBody();
  }
}
