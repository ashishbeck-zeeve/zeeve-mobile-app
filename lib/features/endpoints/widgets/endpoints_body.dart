import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/endpoints/provider/provider.dart';

class EndpointsBody extends StatelessWidget {
  const EndpointsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EndpointsNotifier>(
      builder: (context, state, child) {
        return Center(
          child: EmptyWidget(
            packageImage: PackageImage.Image_2,
            title: "Add Endpoint",
            subTitle:
                "First step to join this program you must login & register",
          ),
        );
      },
    );
  }
}
