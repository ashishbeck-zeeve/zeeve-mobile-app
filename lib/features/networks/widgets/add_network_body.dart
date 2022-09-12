import 'package:app_ui/app_ui.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/widgets/add_network_item.dart';
import 'package:zeeve/features/networks/widgets/network_item.dart';
import 'package:zeeve/features/settings/provider/provider.dart';

class AddNetworkBody extends StatelessWidget {
  const AddNetworkBody({Key? key}) : super(key: key);

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

    Widget networkTile() {
      return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            // color: ZeeveColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            // border: Border.all(color: ZeeveColors.secondary),
          ),
          width: 180,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.bubble_chart)),
                TextSpan(text: "BYOC-AWS")
              ])),
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.bubble_chart)),
                TextSpan(text: "Node/Notary/NMS Node types")
              ])),
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.bubble_chart)),
                TextSpan(text: "Monitoring & Analytics Enabled")
              ])),
              Divider(),
              Text("Corda")
            ],
          ));
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
      ],
      child: Consumer<SettingsNotifier>(
        builder: (context, state, child) {
          return false
              ? empty()
              : ListView(
                  children: const [
                    AddNetworkItem(
                      imgPath: 'assets/images/corda.svg',
                      text1: 'BYOC-AWS',
                      text2: 'Node/Notary/NMS Node types',
                      text3: 'Monitoring & Analytics Enabled',
                      availableNodes: 6,
                      totalNodes: 30,
                    ),
                    AddNetworkItem(
                      imgPath: 'assets/images/binance.svg',
                      text1: 'BYOC-DIGITAL-OCEAN',
                      text2: 'Full Node',
                      text3: 'RPC Access',
                      availableNodes: 1,
                      totalNodes: 4,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
