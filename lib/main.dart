import 'package:dadjokes/routes.dart';
import 'package:dadjokes/services/jokes_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config.dart';

void main() {
  runApp(MyApp());
}

//TODO: flutter packages pub run build_runner build

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: jokeService),
      ],
      child: MaterialApp(
        title: Config.appName,
        theme: Config.theme,
        initialRoute: RouteConfig.defaultRoute,
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
