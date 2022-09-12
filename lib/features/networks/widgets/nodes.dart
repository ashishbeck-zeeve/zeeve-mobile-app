import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Nodes extends StatefulWidget {
  const Nodes({Key? key}) : super(key: key);

  @override
  State<Nodes> createState() => _NodesState();
}

class _NodesState extends State<Nodes> {
  @override
  Widget build(BuildContext context) {
    Widget item() {
      return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: ZeeveConstants.radius,
        ),
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/aws-icon.svg',
                    width: 25,
                    color: ZeeveColors.primary,
                  ),
                  Text(
                    '48u1z28u...4yl5pj7g (ap-south-1)',
                    style: ZeeveTextStyle.caption,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ADMIN',
                    style: ZeeveTextStyle.button,
                  ),
                  Text(
                    'ORDERER',
                    style: ZeeveTextStyle.button,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        item(),
        item(),
        item(),
      ],
    );
  }
}
