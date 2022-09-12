import 'package:animations/animations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/endpoints/endpoints.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:zeeve/features/networks/networks.dart';
import 'package:zeeve/features/settings/settings.dart';
import 'package:zeeve/features/workspace/workspace.dart';
import 'package:zeeve/features/zdfs/zdfs.dart';
import 'package:zeeve/models/drawer_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Explore';
  }
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    List<DrawerPage> drawerPages = [
      DrawerPage(
        title: 'Workspace',
        icon: const Icon(Icons.group_work, color: ZeeveColors.primary),
        page: const WorkspacePage(),
      ),
      DrawerPage(
        title: 'Marketplace',
        icon: const Icon(Icons.shopping_basket, color: ZeeveColors.primary),
        page: const MarketplacePage(),
      ),
      DrawerPage(
        title: 'Networks',
        icon: const Icon(Icons.pie_chart, color: ZeeveColors.primary),
        page: const AllNetworksPage(),
      ),
      DrawerPage(
        title: 'Endpoints',
        icon: const Icon(Icons.polyline_outlined, color: ZeeveColors.primary),
        page: const EndpointsPage(),
      ),
      DrawerPage(
        title: 'ZDFS',
        icon: const Icon(Icons.folder_special, color: ZeeveColors.primary),
        page: const ZdfsPage(),
      ),
      DrawerPage(
        title: 'Settings',
        icon: const Icon(Icons.settings, color: ZeeveColors.primary),
        page: const SettingsPage(),
      ),
    ];

    Widget listItem(DrawerPage e) {
      return OpenContainer(
        closedElevation: 0,
        closedColor: Theme.of(context).canvasColor,
        openColor: Theme.of(context).canvasColor,
        transitionDuration: const Duration(milliseconds: 400),
        useRootNavigator: e.title == 'Settings',
        closedBuilder: (BuildContext context, void Function() action) =>
            ListTile(
          leading: e.icon,
          title: Text(e.title),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        openBuilder: (BuildContext context,
                void Function({Object? returnValue}) action) =>
            e.page,
      );
      // return ListTile(
      //   leading: e.icon,
      //   title: Text(e.title),
      //   trailing: const Icon(Icons.keyboard_arrow_right),
      //   onTap: () {
      //     Navigator.of(context, rootNavigator: e.title == 'Settings')
      //         .push(MaterialPageRoute(builder: (context) => e.page));
      //   },
      // );
    }

    return Scaffold(
      appBar: CommonWidgets.appBar(context, 'Explore', showBack: false),
      body: ListView(
        children: drawerPages.map((e) => listItem(e)).toList(),
      ),
    );
  }
}
