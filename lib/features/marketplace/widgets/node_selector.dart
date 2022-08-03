import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

class NodeSelector extends StatelessWidget {
  const NodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketplaceNotifier>(builder: (context, state, child) {
      return SizedBox(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl<int>(
          children: {
            0: Text(
              'Full',
              style: ZeeveTextStyle.caption.copyWith(color: ZeeveColors.white),
            ),
            1: Text(
              'Archive',
              style: ZeeveTextStyle.caption.copyWith(color: ZeeveColors.white),
            ),
          },
          groupValue: state.nodeValue,
          onValueChanged: (int? val) {
            if (val == null) return;
            state.updateNodeValue(val);
          },
          backgroundColor: Colors.black.withOpacity(0.2),
          thumbColor: ZeeveColors.primary,
        ),
      );
    });
  }
}
