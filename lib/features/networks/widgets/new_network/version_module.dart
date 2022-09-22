import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/networks/provider/networks_provider.dart';
import 'package:zeeve/features/networks/widgets/new_network/subheading.dart';
import 'package:zeeve/features/networks/widgets/new_network/top_title.dart';

class VersionModulePage extends StatefulWidget {
  const VersionModulePage({super.key});

  @override
  State<VersionModulePage> createState() => _VersionModulePageState();
}

class _VersionModulePageState extends State<VersionModulePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<NetworksNotifier>(
      builder: (context, state, child) {
        Widget versionTile(String title) {
          return MyRadioTile(
            title: title,
            groupValue: state.params.version,
            onChanged: (value) {
              setState(() {
                state.params.version = title;
              });
            },
          );
        }

        Widget consensusTile(String title) {
          return MyRadioTile(
            title: title,
            groupValue: state.params.consensus,
            onChanged: (value) {
              setState(() {
                state.params.consensus = title;
              });
            },
          );
        }

        return ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            const SubHeading(title: 'Choose Version'),
            versionTile('2.2 LTS'),
            versionTile('1.4 LTS'),
            const SubHeading(title: 'Choose Consensus Type'),
            consensusTile('Raft'),
            consensusTile('Solo'),
            consensusTile('Kafka'),
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
