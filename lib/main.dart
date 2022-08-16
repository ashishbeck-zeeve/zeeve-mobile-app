import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/pages/auth_wrapper.dart';
import 'package:zeeve/providers/auth.dart';
import 'package:zeeve/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  await GetStorage().initStorage;
  await storageService.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthWrapperNotifier()),
      ],
      child: MaterialApp(
        title: 'Zeeve Mobile App',
        debugShowCheckedModeBanner: false,
        theme: ZeeveTheme.standard,
        // home: const LoginPage(),
        home: const AuthWrapperPage(),
      ),
    );
  }
}
