import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../../marketplace/view/marketplace_page.dart';

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
      return GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MarketplacePage())),
        child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: ZeeveColors.gray),
              borderRadius: BorderRadius.circular(15),
            ),
            width: width * 0.4,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("r3.C.rda",
                    style: TextStyle(color: Colors.red, fontSize: 22)),
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(Icons.bubble_chart, color: Colors.red)),
                  TextSpan(text: "BYOC-AWS")
                ])),
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(Icons.bubble_chart, color: Colors.red)),
                  TextSpan(text: "Node/Notary/NMS Node types")
                ])),
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(Icons.bubble_chart, color: Colors.red)),
                  TextSpan(text: "Monitoring & Analytics Enabled")
                ])),
                Divider(),
                Text("Corda")
              ],
            )),
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MarketplacePage())),
        ),
        appBar: CommonWidgets.appBar(
          context,
          isnetworkPage ? "Add Network" : "Add Endpoints",
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: isnetworkPage
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  isnetworkPage ? networkTile() : Container(),
                  isnetworkPage
                      ? CommonWidgets.messageButton(
                          context,
                          "Buy Subscription",
                          isnetworkPage
                              ? "Purchase nodes for your blockchain protocol"
                              : "Purchase endpoints for your blockchain protocol",
                          Icons.add,
                          //     () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const MarketplacePage()));
                          // }
                        )
                      : Center(
                          child: CommonWidgets.messageButton(
                          context,
                          "Buy Subscription",
                          isnetworkPage
                              ? "Purchase nodes for your blockchain protocol"
                              : "Purchase endpoints for your blockchain protocol",
                          Icons.add,
                          //     () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const MarketplacePage()));
                          // }
                        ))
                ],
              ),
              // const Spacer(),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: CommonWidgets.commonButton(context, "Buy Subscription",
              //       icon: const Icon(Icons.add), onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const MarketplacePage()));
              //   }),
              // ),
            ],
          ),
        ));
  }
}
