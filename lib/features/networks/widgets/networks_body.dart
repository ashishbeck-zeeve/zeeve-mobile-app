import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/view/buysubscription_page.dart';
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
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Container(
            padding: const EdgeInsets.all(16),
            width: width,
            height: height,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: CommonWidgets.messageButton(
                      context,
                      "Add Network",
                      "First step to join this program you must login & register",
                      Icons.add,
                      // () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             BuySubscriptionPage(isnetworkPage: true)))
                    ),
                  ),
                ),
                // CommonWidgets.commonButton(context, "Add Node/Network",
                //     icon: const Icon(Icons.add),
                //     onPressed: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 BuySubscriptionPage(isnetworkPage: true))))
              ],
            ),
          );
        },
      ),
    );
  }
}
