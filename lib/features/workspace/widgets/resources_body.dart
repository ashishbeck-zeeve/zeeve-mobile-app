import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/workspace/provider/provider.dart';

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
        return Center(
          child: EmptyWidget(
            packageImage: PackageImage.Image_4,
            subTitle: "Add endpoints or networks to continue",
          ),
        );
      },
    );
  }
}
