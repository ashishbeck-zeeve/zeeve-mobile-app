import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

class BuySubscriptionPage extends StatelessWidget {
  bool isnetworkPage = true;
  BuySubscriptionPage({
    Key? key,
    required this.isnetworkPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget networkTile() {
      return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: ZeeveColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            // border: Border.all(color: ZeeveColors.secondary),
          ),
          width: 180,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("r3.C.rda",
                  style: TextStyle(color: ZeeveColors.white, fontSize: 22)),
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

    return Scaffold(
        appBar: CommonWidgets.appBar(
          context,
          isnetworkPage ? "Add Network" : "Add Endpoints",
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    isnetworkPage ? networkTile() : Container(),
                    CommonWidgets.messageButton(
                        "Buy Subscription",
                        isnetworkPage
                            ? "Purchase nodes for your blockchain protocol"
                            : "Purchase endpoints for your blockchain protocol",
                        Icons.add, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MarketplacePage()));
                    }),
                  ],
                ),
                // const Spacer(),
                CommonWidgets.commonButton(context, "Buy Subscription",
                    icon: const Icon(Icons.add), onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MarketplacePage()));
                }),
              ],
            ),
          ),
        ));
  }
}
