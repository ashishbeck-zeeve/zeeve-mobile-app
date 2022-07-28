import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/provider/provider.dart';

/// {@template marketplace_body}
/// Body of the MarketplacePage.
///
/// Add what it does
/// {@endtemplate}
class MarketplaceBody extends StatelessWidget {
  /// {@macro marketplace_body}
  const MarketplaceBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketplaceNotifier>(
      builder: (context, state, child) {
        return Text(state.count.toString());
      },
    );
  }
}
