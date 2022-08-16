import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CIDWidget extends StatelessWidget {
  const CIDWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              width: width,
              padding: const EdgeInsets.all(8),
              // height: height * 0.2,
              decoration: BoxDecoration(
                color: ZeeveColors.ternary,
                border: Border.all(color: ZeeveColors.gray),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify a File's Authenticity",
                    style: ZeeveTextStyle.bodyText1.copyWith(
                        color: ZeeveColors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "With the IPFS CID Verifier, you can upload a file, receive an IPFS CID, and ensure the file is exactly the one you expect. All without the file being added to the IPFS network.",
                    style: ZeeveTextStyle.bodyText2,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              width: width,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.upload_file),
                  label: const Text("click here to add or upload your file")),
            )
          ],
        ),
      ),
    );
  }
}
