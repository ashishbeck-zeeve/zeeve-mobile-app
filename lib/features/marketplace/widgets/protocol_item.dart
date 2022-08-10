import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeeve/features/marketplace/view/purchase_page.dart';

class ProtocolItem extends StatelessWidget {
  ProtocolItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imgPath,
  }) : super(key: key);
  final String title;
  final String description;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PurchasePage.route());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        width: width * 0.45,
        decoration: BoxDecoration(
          border: Border.all(color: ZeeveColors.gray),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              imgPath,
              height: 75,
            ),
            Text(
              description,
              style: ZeeveTextStyle.caption.copyWith(fontSize: 12),
              textAlign: TextAlign.justify,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
