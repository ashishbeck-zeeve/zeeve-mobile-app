import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/networks/provider/networks_provider.dart';
import 'package:zeeve/features/networks/widgets/new_network/subheading.dart';
import 'package:zeeve/features/networks/widgets/new_network/top_title.dart';

class CloudModulePage extends StatefulWidget {
  const CloudModulePage({super.key});

  @override
  State<CloudModulePage> createState() => _CloudModulePageState();
}

class _CloudModulePageState extends State<CloudModulePage>
    with AutomaticKeepAliveClientMixin {
  final workspaces = [
    'Public Nodes',
    'Fabric Networks',
    'Corda Networks',
  ];
  final accounts = [
    'zeevedev',
    'zeeve-demo',
  ];
  final regions = [
    'us-east-1',
    'us-east-2',
    'us-west-1',
    'us-west-2',
    'ap-south-1',
    'ap-south-2',
  ];
  final instanceDetails = [
    't2.medium',
    't3.large',
    'm2.large',
    'm2.medium',
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<NetworksNotifier>(
      builder: (context, state, child) {
        var cloudConfig = state.params.cloudConfig;
        return ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            InputFields.genericTextField(
              title: 'Network Name',
              initialValue: cloudConfig.name,
              obscurity: true,
              onChanged: (value) => cloudConfig.name = value ?? '',
            ),
            InputFields.dropDown(
              title: 'Workspace',
              value: cloudConfig.workspace,
              options: workspaces,
              onChanged: (value) => cloudConfig.workspace = value ?? '',
            ),
            InputFields.dropDown(
              title: 'Cloud Account',
              value: cloudConfig.account,
              options: accounts,
              onChanged: (value) => cloudConfig.account = value ?? '',
            ),
            InputFields.dropDown(
              title: 'Region',
              value: cloudConfig.region,
              options: regions,
              onChanged: (value) => cloudConfig.region = value ?? '',
            ),
            InputFields.numberTextField(
              title: 'Instances',
              initialValue: cloudConfig.instances.toString(),
              onChanged: (value) => cloudConfig.instances = int.tryParse(
                    value ?? '0',
                  ) ??
                  0,
            ),
            InputFields.dropDown(
              title: 'Instance Details',
              value: cloudConfig.instanceDetail,
              options: instanceDetails,
              onChanged: (value) => cloudConfig.instanceDetail = value ?? '',
            ),
            const SizedBox(
              height: kBottomNavigationBarHeight,
            )
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
