import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:zeeve/features/zdfs/provider/provider.dart';
import 'package:zeeve/features/zdfs/widgets/cidwidget.dart';
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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("ZDFS"),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
                // indicatorColor: ZeeveColors.orange,
                automaticIndicatorColorAdjustment: true,
                labelColor: ZeeveColors.white,
                labelStyle: ZeeveTextStyle.button.copyWith(
                    color: ZeeveColors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: "Files"),
                  Tab(text: "File CID Verifier"),
                ]),
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.ads_click,
            activeIcon: Icons.close,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.file_upload),
                label: "Upload File",
                onTap: () {},
              ),
              SpeedDialChild(
                child: const Icon(Icons.query_stats),
                label: "View Usage",
                onTap: () {},
              ),
              SpeedDialChild(
                child: const Icon(Icons.delete_sweep),
                label: "Actions",
                onTap: () {},
              ),
            ],
          ),
          body: const TabBarView(
            children: [ZdfsView(), CIDWidget()],
          ),
        ),
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
