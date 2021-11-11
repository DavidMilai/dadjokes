import 'dart:math';

import 'package:dadjokes/data/models/joke.dart';
import 'package:dadjokes/services/jokes_service.dart';
import 'package:dadjokes/utils/color.dart';
import 'package:dadjokes/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> cardColor = [];
  Random random = new Random();

  rebuild() {}

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
    rebuild();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  jokeService.getJokes();
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Selector<JokeService, List<Joke>>(
            selector: (context, jokeService) => jokeService.allJokes,
            builder: (context, jokes, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Center(
                      child: SwipableStack(
                        stackClipBehaviour: Clip.antiAlias,
                        itemCount: jokes.length,
                        builder: (context, index, constraints) {
                          cardColor.add(AppColors.getColor());
                          var joke = jokes[index];
                          return CardDisplay(
                            text: joke.text,
                            cardColor: cardColor[index],
                          );
                        },
                        onSwipeCompleted: (index, direction) {
                          print('$index, $direction');
                          jokeService.getJokes();
                        },
                        overlayBuilder: (
                          context,
                          constraints,
                          index,
                          direction,
                          swipeProgress,
                        ) {
                          final opacity = min(swipeProgress, 1.0);
                          return Opacity(
                            opacity: opacity,
                            child: Text("Hello"),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
