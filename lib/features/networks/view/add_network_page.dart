import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/view/marketplace_page.dart';
import 'package:zeeve/features/networks/provider/provider.dart';
import 'package:zeeve/features/networks/widgets/add_network_body.dart';

class AddNetworkPage extends StatelessWidget {
  /// {@macro networks_page}
  const AddNetworkPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddNetworkPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NetworksNotifier()),
      ],
      child: Scaffold(
        appBar: CommonWidgets.appBar(
          context,
          'Add Network',
        ),
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: const Text('Buy Subscription'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MarketplacePage()))),
        // appBar: AppBar(
        //   title: const Text("Network"),
        //   centerTitle: true,
        // ),
        body: const AddNetworkView(),
      ),
    );
  }
}

class AddNetworkView extends StatelessWidget {
  const AddNetworkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddNetworkBody();
  }
}
