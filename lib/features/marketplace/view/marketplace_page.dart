import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/provider/provider.dart';
import 'package:zeeve/features/marketplace/widgets/marketplace_body.dart';

/// {@template marketplace_page}
/// A description for MarketplacePage
/// {@endtemplate}
class MarketplacePage extends StatelessWidget {
  /// {@macro marketplace_page}
  const MarketplacePage({Key? key}) : super(key: key);

  /// The static route for MarketplacePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MarketplacePage());
  }
 
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          ChangeNotifierProvider(create: (_) => MarketplaceNotifier()),
      child: const Scaffold(
        body: MarketplaceView(),
      ),
    );
  }   
}

/// {@template marketplace_view}
/// Displays the Body of MarketplaceView
/// {@endtemplate}
class MarketplaceView extends StatelessWidget {
  /// {@macro marketplace_view}
  const MarketplaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MarketplaceBody();
  }
}