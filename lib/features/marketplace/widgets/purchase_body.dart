import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/provider/provider.dart';
import 'package:zeeve/features/marketplace/widgets/cloud_providers_selector.dart';
import 'package:zeeve/features/marketplace/widgets/cloud_selector.dart';
import 'package:zeeve/features/marketplace/widgets/node_selector.dart';
import 'package:zeeve/features/marketplace/widgets/permissive_protocols.dart';
import 'package:zeeve/features/marketplace/widgets/protocol_item.dart';
import 'package:zeeve/features/marketplace/widgets/public_protocols.dart';
import 'package:zeeve/features/marketplace/widgets/tab_bar.dart';
import 'package:zeeve/features/marketplace/widgets/textfield.dart';

/// {@template marketplace_body}
/// Body of the MarketplacePage.
///
/// Add what it does
/// {@endtemplate}
class PurchaseBody extends StatelessWidget {
  /// {@macro marketplace_body}
  PurchaseBody({Key? key}) : super(key: key);
  final controller = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketplaceNotifier>(
      builder: (context, state, child) {
        Widget costItem(String title, String value) {
          return Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ZeeveColors.gray,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: ZeeveTextStyle.subtitle2.copyWith(fontSize: 10),
                  ),
                  Text(
                    value,
                    style: ZeeveTextStyle.subtitle2.copyWith(
                        fontSize: 10, fontWeight: ZeeveFontWeight.light),
                  ),
                ]),
          );
        }

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select your Subscription Options',
                  style: ZeeveTextStyle.headline6,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Select your cloud type',
                  style: ZeeveTextStyle.subtitle2,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CloudSelector(),
                const SizedBox(
                  height: 8,
                ),
                state.cloudValue == 0
                    ? const CloudProvidersSelector()
                    : Container(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Select node type',
                  style: ZeeveTextStyle.subtitle2,
                ),
                const SizedBox(
                  height: 8,
                ),
                const NodeSelector(),
                const SizedBox(
                  height: 16,
                ),
                costItem('Per node monthly cost', '\$449'),
                const SizedBox(
                  height: 4,
                ),
                costItem('Total monthly cost', '\$449'),
                const SizedBox(
                  height: 8,
                ),
                NodesTextField(controller: controller),
                const SizedBox(
                  height: 8,
                ),
                MyButton(text: 'Subscribe', onPressed: () {})
              ],
            ),
          ),
        );
      },
    );
  }
}
