import 'package:dadjokes/data/database.dart';
import 'package:dadjokes/routes.dart';
import 'package:dadjokes/services/jokes_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initDatabase() async {
    await db.init();
    jokeService.getJokes();
    jokeService.getJokes();
    jokeService.getJokes();
    await Future.delayed(Duration(seconds: 1), navigate);
  }

  navigate() {
    Navigator.pushReplacementNamed(context, RouteConfig.home);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
