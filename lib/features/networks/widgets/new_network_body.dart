// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

import 'package:zeeve/core/constants.dart';
import 'package:zeeve/features/networks/provider/networks_provider.dart';
import 'package:zeeve/features/networks/widgets/new_network/bottom_controls.dart';
import 'package:zeeve/features/networks/widgets/new_network/channel_module.dart';
import 'package:zeeve/features/networks/widgets/new_network/cloud_module.dart';
import 'package:zeeve/features/networks/widgets/new_network/organisation_module.dart';
import 'package:zeeve/features/networks/widgets/new_network/top_title.dart';
import 'package:zeeve/features/networks/widgets/new_network/version_module.dart';
import 'package:zeeve/features/settings/provider/provider.dart';

class NewNetworkBody extends StatelessWidget {
  const NewNetworkBody({Key? key}) : super(key: key);

  static const titles = [
    'Version',
    'Organisation',
    'Channel Details',
    'Cloud Configuration',
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NetworksNotifier()),
        ],
        child: Consumer<NetworksNotifier>(
          builder: (context, state, child) {
            final isFirst = state.pageController.hasClients
                ? state.pageController.page == 0
                : true;
            final step = (state.pageController.hasClients
                    ? state.pageController.page!
                    : 0)
                .toInt();
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: const Alignment(-0.95, 0),
                      child: TopTitle(
                        title: titles[step],
                        step: step + 1,
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: state.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {},
                        children: const [
                          VersionModulePage(),
                          OrgModulePage(),
                          ChannelModulePage(),
                          CloudModulePage(),
                        ],
                      ),
                    ),
                  ],
                ),
                BottomControls(
                  isFirst: isFirst,
                  state: state,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
