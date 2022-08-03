import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

class CloudSelector extends StatelessWidget {
  const CloudSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketplaceNotifier>(builder: (context, state, child) {
      return CupertinoSlidingSegmentedControl<int>(
        children: {
          0: Text(
            'Bring Your Own cloud',
            style: ZeeveTextStyle.caption.copyWith(color: ZeeveColors.white),
          ),
          1: Text(
            'Zeeve Managed Cloud',
            style: ZeeveTextStyle.caption.copyWith(color: ZeeveColors.white),
          ),
        },
        groupValue: state.cloudValue,
        onValueChanged: (int? val) {
          if (val == null) return;
          state.updateCloudValue(val);
        },
        backgroundColor: Colors.black.withOpacity(0.2),
        thumbColor: ZeeveColors.primary,
      );
    });
  }
}
