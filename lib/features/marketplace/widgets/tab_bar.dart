import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _tabItem(String text) {
      return Center(child: Text(text));
    }

    final tabs = [
      _tabItem("Public Protocols"),
      _tabItem("Permissive Protocols"),
    ];

    return TabBar(
      tabs: tabs,
      indicatorColor: ZeeveColors.green,
      indicatorSize: TabBarIndicatorSize.label,
      automaticIndicatorColorAdjustment: false,
      labelPadding: const EdgeInsets.all(8),
      // labelColor: ZeeveColors.white,
      // unselectedLabelColor: ZeeveColors.darkGray,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(24);
}
