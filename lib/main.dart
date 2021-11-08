import 'package:dadjokes/routes.dart';
import 'package:flutter/material.dart';

import 'config.dart';

void main() {
  runApp(MyApp());
}

// flutter packages pub run build_runner build

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: Config.theme,
      initialRoute: RouteConfig.defaultRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
