import 'package:animations/animations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/dashboard/widgets/dashboard_body.dart';
import 'package:zeeve/features/dashboard/widgets/drawer.dart';
import 'package:zeeve/features/dashboard/widgets/notifications.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
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
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).push(
            PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1, 0);
                var end = Offset.zero;
                var curve = Curves.easeOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              // transitionDuration: const Duration(milliseconds: 2000),
              // reverseTransitionDuration: const Duration(milliseconds: 2000),
              pageBuilder: (context, animation, animation2) => e.page,
            ),
          );
        },
      );
    }

    return ChangeNotifierProvider(
      create: (_) => DashboardNotifier(),
      child: Scaffold(
        key: drawerScaffoldKey,
        appBar: CommonWidgets.appBar(
          context,
          'Dashboard',
          showBack: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                drawerScaffoldKey.currentState?.openEndDrawer();
              },
            )
          ],
        ),
        floatingActionButton: OpenContainer(
          closedElevation: 10,
          closedColor: Theme.of(context).primaryColor,
          openColor: Theme.of(context).canvasColor,
          transitionDuration: const Duration(milliseconds: 400),
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          closedBuilder: (BuildContext context, void Function() action) =>
              const FloatingActionButton.extended(
            icon: Icon(Icons.add),
            label: Text('Deploy Node'),
            onPressed: null,
          ),
          openBuilder: (BuildContext context,
                  void Function({Object? returnValue}) action) =>
              const MarketplacePage(),
        ),
        drawer:
            MyDrawer(drawerPages: drawerPages.map((e) => listItem(e)).toList()),
        endDrawer: const Notifications(),
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
