import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeeve/features/networks/view/network_page.dart';

class NetworkItem extends StatelessWidget {
  final String nickname;
  final String imgPath;
  final int activeNodes;
  final int inactiveNodes;
  const NetworkItem({
    Key? key,
    required this.nickname,
    required this.imgPath,
    required this.activeNodes,
    required this.inactiveNodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NetworkPage(
              title: nickname,
            ),
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: ZeeveConstants.radius,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    nickname,
                    style: ZeeveTextStyle.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset(
                    imgPath,
                    width: 175,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Active Nodes'),
                  Text(
                    activeNodes.toString(),
                    style: ZeeveTextStyle.subtitle2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Inactive Nodes'),
                  Text(
                    inactiveNodes.toString(),
                    style: ZeeveTextStyle.subtitle2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
