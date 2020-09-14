import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/generated/l10n.dart';
import 'package:wallet/ui/app_controller.dart';
import 'package:wallet/ui/screens/demo_screen.dart';
import 'package:wallet/ui/screens/home/home_screen.dart';
import 'package:wallet/ui/screens/login/login_screen.dart';
import 'package:wallet/ui/screens/main/main_screen.dart';
import 'package:wallet/ui/screens/splash_screen.dart';

class WApp extends StatefulWidget {
  @override
  _WAppState createState() => _WAppState();
}

class _WAppState extends State<WApp> {
  initStorage() async {
    await GetStorage.init();
    await GetStorage.init(StorageConst.homeGroupBox);
  }

  @override
  void initState() {
    super.initState();
    initStorage();
    Get.put(AppController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepPurple,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      getPages: [
        GetPage(name: Routes.root, page: () => SplashScreen()),
        GetPage(name: Routes.main, page: () => MainScreen()),
        GetPage(name: Routes.login, page: () => LoginScreen()),
      ],
    );
  }
}

class Routes {
  static const root = '/';
  static const main = 'main';
  static const login = 'login';
}
