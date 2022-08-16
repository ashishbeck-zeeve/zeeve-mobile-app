import 'package:app_ui/app_ui.dart';
import 'package:empty_widget/empty_widget.dart';
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
          border: Border.all(color: ZeeveColors.darkGray),
          color: ZeeveColors.ternary,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: const EdgeInsets.all(8),
        width: width,
        height: 60,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$label :", style: ZeeveTextStyle.bodyText2),
              Text(" $content")
            ]),
      );
    }

    Widget planTiles() {
      Widget infoItem(String title, String value) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        );
      }

      return Container(
        margin: const EdgeInsets.all(6),
        width: width,
        padding: const EdgeInsets.all(8),
        // height: height * 0.15,
        decoration: BoxDecoration(
          // color: ZeeveColors.ternary,
          border: Border.all(color: ZeeveColors.darkGray),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    infoItem("Services:", ""),
                    infoItem("Monthly Cost:", ""),
                    infoItem("Next Billing Cycle:", ""),
                    infoItem("Total Subscribed:", ""),
                    infoItem("Available:", "")
                  ]),
            ),
            SizedBox(
              width: height * 0.1,
              height: height * 0.1,
              child: EmptyWidget(
                subTitle: "No data",
              ),
            ),
          ],
        ),
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
              planTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
