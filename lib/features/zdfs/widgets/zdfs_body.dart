import 'package:flutter/material.dart';
import 'package:zeeve/features/zdfs/provider/provider.dart';

class ZdfsBody extends StatelessWidget {
  const ZdfsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<ZdfsNotifier>(
      builder: (context, state, child) {
        return Container(
            padding: const EdgeInsets.all(16),
            width: width,
            height: height,
            child: const Center(child: Text("No data")));
      },
    );
  }
}
