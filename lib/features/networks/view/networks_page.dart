import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/provider/provider.dart';
import 'package:zeeve/features/networks/widgets/networks_body.dart';

class NetworksPage extends StatelessWidget {
  /// {@macro networks_page}
  const NetworksPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const NetworksPage());
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
          'Network',
        ),
        body: const NetworksView(),
      ),
    );
  }
}

class NetworksView extends StatelessWidget {
  const NetworksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NetworksBody();
  }
}
