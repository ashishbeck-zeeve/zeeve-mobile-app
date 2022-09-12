import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/view/marketplace_page.dart';
import 'package:zeeve/features/networks/provider/provider.dart';
import 'package:zeeve/features/networks/view/add_network_page.dart';
import 'package:zeeve/features/networks/widgets/all_networks_body.dart';

class AllNetworksPage extends StatelessWidget {
  /// {@macro networks_page}
  const AllNetworksPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AllNetworksPage());
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
          'All Networks',
        ),
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: const Text('Add Network'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNetworkPage()))),
        // appBar: AppBar(
        //   title: const Text("Network"),
        //   centerTitle: true,
        // ),
        body: const NetworksView(),
      ),
    );
  }
}

class NetworksView extends StatelessWidget {
  const NetworksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AllNetworksBody();
  }
}
