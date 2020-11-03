import 'package:flutter/material.dart';
import 'package:jawara/app/app.dart';
import 'package:jawara/app/locator.dart';
import 'package:jawara/ui/pages.dart';
import 'core/service/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      navigatorKey: locator<NavigatorService>().navigatorKey,
    );
  }
}
