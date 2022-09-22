import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/networks/provider/networks_provider.dart';
import 'package:zeeve/features/networks/widgets/new_network/subheading.dart';
import 'package:zeeve/features/networks/widgets/new_network/top_title.dart';

class ChannelModulePage extends StatefulWidget {
  const ChannelModulePage({super.key});

  @override
  State<ChannelModulePage> createState() => _ChannelModulePageState();
}

class _ChannelModulePageState extends State<ChannelModulePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<NetworksNotifier>(
      builder: (context, state, child) {
        var channel = state.params.channelDetails;

        return ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            const SubHeading(title: 'System Channel'),
            InputFields.numberTextField(
              title: 'Batch Timeout (in sec)',
              initialValue: channel.batchTimeout.toString(),
              onChanged: (value) => channel.batchTimeout = int.tryParse(
                    value ?? '0',
                  ) ??
                  0,
            ),
            InputFields.numberTextField(
              title: 'Max Message Count',
              initialValue: channel.maxMessageCount.toString(),
              onChanged: (value) => channel.maxMessageCount = int.tryParse(
                    value ?? '0',
                  ) ??
                  0,
            ),
            InputFields.numberTextField(
              title: 'Absolute Max Bytes (in MB)',
              initialValue: channel.absoluteMaxBytes.toString(),
              onChanged: (value) => channel.absoluteMaxBytes = int.tryParse(
                    value ?? '0',
                  ) ??
                  0,
            ),
            InputFields.numberTextField(
              title: 'Preferred Max Bytes (in KB)',
              initialValue: channel.preferredMaxBytes.toString(),
              onChanged: (value) => channel.preferredMaxBytes = int.tryParse(
                    value ?? '0',
                  ) ??
                  0,
            ),
            SwitchListTile.adaptive(
              title:
                  const Text('Create application channel and join all Peers'),
              value: channel.createAppChannel,
              onChanged: (value) =>
                  setState(() => channel.createAppChannel = value),
            ),
            channel.createAppChannel
                ? InputFields.genericTextField(
                    title: 'Channel Name',
                    initialValue: channel.channelName,
                    obscurity: true,
                    onChanged: (value) => channel.channelName = value ?? '',
                  )
                : const SizedBox.shrink(),
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
