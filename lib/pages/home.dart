import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/dashboard/view/dashboard_page.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:zeeve/features/workspace/view/workspace_page.dart';
import 'package:zeeve/models/drawer_page.dart';
import 'package:zeeve/providers/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

GlobalKey<ScaffoldState> drawerScaffoldKey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int index = 0;

  List<DrawerPage> drawerPages = [
    DrawerPage(
      title: 'Dashboard',
      icon: const Icon(Icons.dashboard),
      page: const DashboardPage(),
    ),
    DrawerPage(
      title: 'Workspace',
      icon: const Icon(Icons.group_work),
      page: const WorkspacePage(),
    ),
    DrawerPage(
      title: 'Marketplace',
      icon: const Icon(Icons.shopping_basket),
      page: const MarketplacePage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Color darkNavBar = darkTheme.bottomNavigationBarTheme.backgroundColor!;
    Color lightNavBar = const Color(0xFFF4F5F6);

    Widget listItem(DrawerPage e) {
      return ListTile(
        leading: e.icon,
        title: Text(e.title),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            index = drawerPages.indexWhere((x) => x.title == e.title);
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(drawerPages[index].title),
        centerTitle: true,
      ),
      drawer: MyDrawer(
        drawerPages: drawerPages.map((e) => listItem(e)).toList(),
      ),
      body: drawerPages[index].page,
    );

    return MyButton(
        text: 'logout',
        onPressed: () {
          final authWrapper = context.read<AuthWrapperNotifier>();
          authWrapper.updateAuthToken(null);
        });
  }
}
