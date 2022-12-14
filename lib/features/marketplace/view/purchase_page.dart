import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/provider/provider.dart';
import 'package:zeeve/features/marketplace/widgets/purchase_body.dart';

/// {@template marketplace_page}
/// A description for MarketplacePage
/// {@endtemplate}
class PurchasePage extends StatelessWidget {
  /// {@macro marketplace_page}
  const PurchasePage({Key? key}) : super(key: key);

  /// The static route for MarketplacePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PurchasePage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MarketplaceNotifier(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CommonWidgets.appBar(context, 'Purchase'),
          body: const PurchaseView(),
        ),
      ),
    );
  }
}

/// {@template marketplace_view}
/// Displays the Body of MarketplaceView
/// {@endtemplate}
class PurchaseView extends StatelessWidget {
  /// {@macro marketplace_view}
  const PurchaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PurchaseBody();
  }
}
