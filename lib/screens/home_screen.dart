import 'package:dadjokes/services/jokes_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    jokeService.cacheData();
  }

  @override
  void dispose() {
    super.dispose();
    jokeService.clearCacheData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: IconButton(
                  onPressed: () {
                    jokeService.getJokes();
                  },
                  icon: Icon(Icons.add)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: jokeService.allJokes.length,
                  itemBuilder: (context, item) {
                    var joke = jokeService.allJokes[item];
                    return Text("${joke.text}*********");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
