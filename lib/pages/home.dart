import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/dashboard/view/dashboard_page.dart';
import 'package:zeeve/features/endpoints/endpoints.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:zeeve/features/networks/networks.dart';
import 'package:zeeve/features/settings/settings.dart';
import 'package:zeeve/features/workspace/view/workspace_page.dart';
import 'package:zeeve/features/zdfs/view/zdfs_page.dart';
import 'package:zeeve/models/drawer_page.dart';
import 'package:zeeve/pages/explore.dart';
import 'package:zeeve/providers/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

GlobalKey<ScaffoldState> drawerScaffoldKey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int index = 0;
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> pages = [const DashboardPage(), const ExplorePage()];

  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        title: "Dashboard",
        activeColorPrimary: ZeeveColors.primary,
        inactiveColorPrimary: Colors.grey),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.explore),
        title: "Explore",
        activeColorPrimary: ZeeveColors.primary,
        inactiveColorPrimary: Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    // Color darkNavBar = darkTheme.bottomNavigationBarTheme.backgroundColor!;
    Color lightNavBar = const Color(0xFFF4F5F6);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: pages,
      items: bottomNavBarItems,
      onItemSelected: (i) {
        drawerScaffoldKey.currentState?.closeDrawer();
        drawerScaffoldKey.currentState?.closeEndDrawer();
      },
      confineInSafeArea: true,
      backgroundColor: lightNavBar, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: lightNavBar,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style8, // Choose the nav bar style with this property.
    );

    return MyButton(
        text: 'logout',
        onPressed: () {
          final authWrapper = context.read<AuthWrapperNotifier>();
          authWrapper.updateAuthToken(null);
        });
  }
}
