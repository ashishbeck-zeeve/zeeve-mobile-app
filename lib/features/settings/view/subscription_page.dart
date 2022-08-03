import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget subscriptionTiles(String label, String content) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: ZeeveColors.secondary),
          color: ZeeveColors.ternary,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: const EdgeInsets.all(4),
        width: width,
        height: 60,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("$label :"), Text(" $content")]),
      );
    }

    Widget planTiles() {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: ZeeveColors.secondary),
          color: ZeeveColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        ),
        margin: const EdgeInsets.all(12),
        width: width * 0.4,
        height: height * 0.3,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Services:", style: TextStyle(color: ZeeveColors.white)),
              Text("Monthly Cost:", style: TextStyle(color: ZeeveColors.white)),
              Text("Next Billing Cycle:",
                  style: TextStyle(color: ZeeveColors.white)),
              Text("Total Subscribed:",
                  style: TextStyle(color: ZeeveColors.white)),
              Text("Available:", style: TextStyle(color: ZeeveColors.white))
            ]),
      );
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              subscriptionTiles("Total Monthly Subscription", "\$0"),
              subscriptionTiles("Current Plan", "Standard"),
              Wrap(
                children: [
                  planTiles(),
                  planTiles(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
