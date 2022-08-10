import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeeve/features/zdfs/widgets/purchasesubscription.dart';

class ZDFSButtons extends StatelessWidget {
  const ZDFSButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget ternaryButton(String label, Widget icon, Function() onPressed) {
      return Container(
        // color: ZeeveColors.ternary,
        margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ZeeveColors.ternary,
          border: Border.all(color: ZeeveColors.gray),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton.icon(
            onPressed: onPressed, icon: icon, label: Text(label)),
      );
    }

    Widget primaryButton(String label, Widget icon, Function() onPressed) {
      return Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.65,
        child: ElevatedButton.icon(
            onPressed: onPressed, icon: icon, label: Text(label)),
      );
    }

    Future<void> browser(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        print("Can't open the URL");
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        ternaryButton(
            "",
            const Icon(Icons.folder),
            () => browser(
                "https://zeeve.readthedocs.io/en/latest/zeeveDistributedFileSystem.html")),
        ternaryButton(
            "",
            const Icon(Icons.file_present),
            () => browser(
                "https://documenter.getpostman.com/view/19460118/Uz59PKx3")),
        ternaryButton(
            "",
            const Icon(Icons.visibility),
            () => browser(
                "https://docs.ipfs.tech/concepts/what-is-ipfs/#decentralization")),
        primaryButton(
            "Purchase Subscription",
            const Icon(Icons.flight),
            () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PurchaseSubscriptionPage()))),
      ],
    );
  }
}
