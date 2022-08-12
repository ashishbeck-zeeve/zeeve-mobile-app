import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/endpoints/provider/provider.dart';
import 'package:zeeve/features/endpoints/widgets/endpoints_body.dart';
import 'package:zeeve/features/networks/view/buysubscription_page.dart';

class EndpointsPage extends StatelessWidget {
  const EndpointsPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const EndpointsPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EndpointsNotifier()),
      ],
      child: Scaffold(
        appBar: CommonWidgets.appBar(context, 'Endpoints'),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.polyline_outlined),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BuySubscriptionPage(isnetworkPage: false)))),
        // appBar: AppBar(
        //   title: const Text("End Points"),
        //   centerTitle: true,
        // ),
        body: const EndpointsView(),
      ),
    );
  }
}

class EndpointsView extends StatelessWidget {
  /// {@macro endpoints_view}
  const EndpointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EndpointsBody();
  }
}
