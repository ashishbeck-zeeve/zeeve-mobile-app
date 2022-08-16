import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/settings/provider/provider.dart';

class NetworksBody extends StatelessWidget {
  const NetworksBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
      ],
      child: Consumer<SettingsNotifier>(
        builder: (context, state, child) {
          return Center(
            child: EmptyWidget(
              packageImage: PackageImage.Image_2,
              title: "Add Network",
              subTitle:
                  "First step to join this program you must login & register",
            ),
          );
        },
      ),
    );
  }
}
