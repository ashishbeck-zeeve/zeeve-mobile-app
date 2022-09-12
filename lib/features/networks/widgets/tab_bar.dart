import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _tabItem(String text) {
      return Tab(
        text: text,
      );
    }

    final tabs = [
      _tabItem("Nodes"),
      _tabItem("Artifacts"),
      _tabItem("Logs"),
    ];

    return TabBar(
      tabs: tabs,
      indicatorColor: ZeeveColors.green,
      indicatorSize: TabBarIndicatorSize.label,
      // labelPadding: const EdgeInsets.all(8),
      labelColor: ZeeveColors.white,
      // unselectedLabelColor: ZeeveColors.darkGray,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(46);
}
