import 'package:flutter/material.dart';
import 'package:zeeve/features/zdfs/provider/provider.dart';
import 'package:zeeve/features/zdfs/widgets/zdfs_body.dart';

class ZdfsPage extends StatelessWidget {
  /// {@macro zdfs_page}
  const ZdfsPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ZdfsPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZdfsNotifier()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ZDFS"),
          centerTitle: true,
        ),
        body: const ZdfsView(),
      ),
    );
  }
}

class ZdfsView extends StatelessWidget {
  const ZdfsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ZdfsBody();
  }
}
