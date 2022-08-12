import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/endpoints/provider/provider.dart';

class EndpointsBody extends StatelessWidget {
  const EndpointsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EndpointsNotifier>(
      builder: (context, state, child) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return Container(
          padding: const EdgeInsets.all(16),
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: CommonWidgets.messageButton(
                    context,
                    "Add Endpoint",
                    "First step to join this program you must login & register",
                    Icons.add,
                    // () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             BuySubscriptionPage(isnetworkPage: false)))
                  ),
                ),
              ),
              // CommonWidgets.commonButton(context, "Add Endpoint",
              //     icon: const Icon(Icons.add),
              //     onPressed: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 BuySubscriptionPage(isnetworkPage: false)))),
            ],
          ),
        );
      },
    );
  }
}
