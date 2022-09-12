import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/widgets/network_item.dart';
import 'package:zeeve/features/settings/provider/provider.dart';

class AllNetworksBody extends StatelessWidget {
  const AllNetworksBody({Key? key}) : super(key: key);

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
          return false
              ? empty()
              : ListView(
                  children: const [
                    NetworkItem(
                      nickname: 'axia',
                      imgPath: 'assets/images/axia.svg',
                      activeNodes: 2,
                      inactiveNodes: 0,
                    ),
                    NetworkItem(
                      nickname: 'dev-net',
                      imgPath: 'assets/images/corda.svg',
                      activeNodes: 4,
                      inactiveNodes: 0,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
