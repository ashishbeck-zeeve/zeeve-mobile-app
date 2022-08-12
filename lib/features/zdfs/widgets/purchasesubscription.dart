import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PurchaseSubscriptionPage extends StatefulWidget {
  const PurchaseSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<PurchaseSubscriptionPage> createState() =>
      _PurchaseSubscriptionPageState();
}

class _PurchaseSubscriptionPageState extends State<PurchaseSubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    planWidget(String plan) {
      Color color = plan == 'basic' ? ZeeveColors.primary : Colors.red;
      List<String> basicData = [
        plan == 'basic' ? "1 GB Storage" : "100 GB Storage",
        plan == 'basic' ? "5 GB Bandwidth Monthly" : "500 GB Bandwidth Monthly",
        "API Based Access",
        "Console Management",
        "Pinning Service",
        plan == 'basic'
            ? "Community Supoort"
            : "24x7 Hours Professional Support"
      ];
      List<Widget> basicIcons = [
        Icon(Icons.storage, color: color),
        Icon(Icons.network_cell, color: color),
        Icon(Icons.api, color: color),
        Icon(Icons.display_settings, color: color),
        Icon(Icons.push_pin, color: color),
        Icon(plan == 'basic' ? Icons.people : Icons.headset_mic, color: color)
      ];
      return Container(
        padding: const EdgeInsets.all(16),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      plan == 'basic' ? "BASIC" : "STANDARD",
                      style: const TextStyle(fontSize: 32),
                    ),
                    Text(
                      plan == 'basic'
                          ? "For Experimenting"
                          : "For Small-scales",
                      style: const TextStyle(
                          fontSize: 16, color: ZeeveColors.black54),
                    )
                  ],
                ),
                plan == 'basic'
                    ? Icon(
                        Icons.flight,
                        color: color,
                        size: height * 0.1,
                      )
                    : Icon(
                        Icons.rocket,
                        color: color,
                        size: height * 0.1,
                      )
              ],
            ),
            const Divider(),
            const Text("Features:"),
            SizedBox(
              height: height * 0.3,
              child: ListView.builder(
                  itemCount: basicData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          basicIcons[index],
                          const SizedBox(width: 10),
                          Text(basicData[index])
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                plan == 'basic'
                    ? "\$0 PER ACCESS ENDPOINT MONTHLY"
                    : "\$25 PER ACCESS ENDPOINT MONTHLY",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: color),
              ),
            ),
            const SizedBox(height: 100)
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
            label: const Text("Purchase")),
        appBar: AppBar(
          title: const Text("Purchase Subscription"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
              // indicatorColor: ZeeveColors.orange,
              automaticIndicatorColorAdjustment: true,
              labelColor: ZeeveColors.white,
              labelStyle: ZeeveTextStyle.button.copyWith(
                  color: ZeeveColors.white, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "BASIC",
                  icon: Icon(Icons.flight),
                ),
                Tab(
                  text: "STANDARD",
                  icon: Icon(Icons.rocket),
                ),
              ]),
        ),
        body: TabBarView(
          children: [planWidget("basic"), planWidget("standard")],
        ),
      ),
    );
  }
}
