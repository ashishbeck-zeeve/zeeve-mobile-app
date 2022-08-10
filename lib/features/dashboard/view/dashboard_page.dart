import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/dashboard/widgets/dashboard_body.dart';
import 'package:zeeve/features/settings/settings.dart';
import 'package:zeeve/models/drawer_page.dart';
import 'package:zeeve/pages/home.dart';

/// {@template dashboard_page}
/// A description for DashboardPage
/// {@endtemplate}
class DashboardPage extends StatelessWidget {
  /// {@macro dashboard_page}
  const DashboardPage({Key? key}) : super(key: key);

  /// The static route for DashboardPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    List<DrawerPage> drawerPages = [
      DrawerPage(
        title: 'Settings',
        icon: const Icon(Icons.settings),
        page: const SettingsPage(),
      ),
    ];
    Widget listItem(DrawerPage e) {
      return ListTile(
        leading: e.icon,
        title: Text(e.title),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => e.page));
        },
      );
    }

    return ChangeNotifierProvider(
      create: (_) => DashboardNotifier(),
      child: Scaffold(
        key: drawerScaffoldKey,
        appBar: CommonWidgets.appBar(context, 'Dashboard', showBack: false),
        drawer:
            MyDrawer(drawerPages: drawerPages.map((e) => listItem(e)).toList()),
        body: const DashboardView(),
      ),
    );
  }
}

/// {@template dashboard_view}
/// Displays the Body of DashboardView
/// {@endtemplate}
class DashboardView extends StatelessWidget {
  /// {@macro dashboard_view}
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardBody();
  }
}
