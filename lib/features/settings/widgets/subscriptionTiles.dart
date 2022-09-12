import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SubscriptionTiles extends StatelessWidget {
  const SubscriptionTiles({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        color: ZeeveColors.ternary,
        border: Border.all(color: ZeeveColors.gray),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Image(
            image: AssetImage("assets/images/ethereum.png"),
            width: 25,
            height: 25),
        infoItem('Services:', 'Ethereum'),
        infoItem('Monthly Cost:', '\$0'),
        infoItem('Next Billing Cycle:', 'Sat Aug 27 2022'),
        infoItem('Total Subscribed:', '2'),
        infoItem('Available:', '1/2'),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Subscribe More")),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Update")),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
