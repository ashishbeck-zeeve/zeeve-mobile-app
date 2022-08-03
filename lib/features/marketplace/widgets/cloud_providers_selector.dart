import 'dart:convert';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

class CloudProvidersSelector extends StatelessWidget {
  const CloudProvidersSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketplaceNotifier>(builder: (context, state, child) {
      Widget cloudItem(String name, String imgPath) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              state.updateCloudProvidersValue(name);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: state.cloudProvidersValue == name
                    ? ZeeveColors.primary.withOpacity(0.4)
                    : ZeeveColors.gray,
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/$imgPath'),
                  Text(
                    name,
                    style: ZeeveTextStyle.caption.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        );
      }

      return Column(
        children: [
          Row(
            children: [
              cloudItem(
                'AWS Cloud',
                'aws.png',
              ),
              cloudItem(
                'Digital Ocean',
                'do.png',
              ),
            ],
          ),
          Row(
            children: [
              cloudItem(
                'Azure',
                'azure.png',
              ),
              cloudItem(
                'GCP',
                'gcp.png',
              ),
            ],
          ),
        ],
      );
    });
  }
}
