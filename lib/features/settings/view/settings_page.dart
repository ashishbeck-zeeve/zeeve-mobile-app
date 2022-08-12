import 'package:app_ui/app_ui.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/settings/provider/provider.dart';
import 'package:zeeve/features/settings/view/profile_page.dart';
import 'package:zeeve/features/settings/widgets/settings_body.dart';

import 'apicredential_page.dart';
import 'cloud_page.dart';
import 'subscription_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SettingsPage());
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final pagecontroller = PageController(initialPage: 0);
  int page = 0;
  List<String> titles = [
    "My Profile",
    "My Cloud",
    "API Credentials",
    "Subscriptions"
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[page]),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.person),
            Icon(Icons.cloud),
            Icon(Icons.vpn_key),
            Icon(Icons.shopping_cart)
          ],
          color: ZeeveColors.white,
          buttonBackgroundColor: ZeeveColors.white,
          backgroundColor: ZeeveColors.primary,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              pagecontroller.jumpToPage(index);
              page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pagecontroller,
            children: const [
              ProfilePage(),
              CloudPage(),
              APICredentialPage(),
              SubscriptionPage()
            ],
            onPageChanged: (int index) {
              setState(() {
                pagecontroller.jumpToPage(index);
                page = index;
              });
            }),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  /// {@macro settings_view}
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingsBody();
  }
}
