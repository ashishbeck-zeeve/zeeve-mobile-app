import 'package:flutter/material.dart';
import 'package:zeeve/features/workspace/provider/provider.dart';
import 'package:zeeve/features/workspace/widgets/workspace_item.dart';

/// {@template workspace_body}
/// Body of the WorkspacePage.
///
/// Add what it does
/// {@endtemplate}
class ResourcesBody extends StatelessWidget {
  /// {@macro workspace_body}
  const ResourcesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkspaceNotifier>(
      builder: (context, state, child) {
        return const Center(
          child: Text('Add endpoints or networks to continue'),
        );
      },
    );
  }
}
