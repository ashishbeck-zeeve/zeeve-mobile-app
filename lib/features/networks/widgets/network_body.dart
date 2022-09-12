import 'package:app_ui/app_ui.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/widgets/artifacts.dart';
import 'package:zeeve/features/networks/widgets/network_item.dart';
import 'package:zeeve/features/networks/widgets/nodes.dart';
import 'package:zeeve/features/settings/provider/provider.dart';

class NetworkBody extends StatelessWidget {
  const NetworkBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget empty() => Center(
          child: EmptyWidget(
            packageImage: PackageImage.Image_2,
            title: "Add Network",
            subTitle:
                "First step to join this program you must login & register",
          ),
        );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
      ],
      child: Consumer<SettingsNotifier>(
        builder: (context, state, child) {
          return const TabBarView(
            children: [
              Nodes(),
              Artifacts(),
              Empty(
                title: 'No Logs Found',
              ),
            ],
          );
        },
      ),
    );
  }
}
