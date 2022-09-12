import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:zeeve/features/networks/provider/provider.dart';
import 'package:zeeve/features/networks/widgets/network_body.dart';
import 'package:zeeve/features/networks/widgets/tab_bar.dart';

class NetworkPage extends StatelessWidget {
  final String? title;

  /// {@macro networks_page}
  const NetworkPage({
    Key? key,
    this.title,
  }) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const NetworkPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NetworksNotifier()),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CommonWidgets.appBar(context, title ?? 'Network',
              bottom: const MyTabBar()),
          // floatingActionButton: FloatingActionButton.extended(
          //     icon: const Icon(Icons.add),
          //     label: const Text('Add Network'),
          //     onPressed: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const AddNetworkPage()))),
          // appBar: AppBar(
          //   title: const Text("Network"),
          //   centerTitle: true,
          // ),
          body: const NetworkView(),
        ),
      ),
    );
  }
}

class NetworkView extends StatelessWidget {
  const NetworkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NetworkBody();
  }
}
