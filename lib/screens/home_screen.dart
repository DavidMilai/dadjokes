import 'dart:math';

import 'package:dadjokes/data/models/joke.dart';
import 'package:dadjokes/services/jokes_service.dart';
import 'package:dadjokes/utils/color.dart';
import 'package:dadjokes/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = SwipableStackController();
  List<Color> cardColor = [];
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    jokeService.cacheData();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   jokeService.clearCacheData();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Selector<JokeService, List<Joke>>(
            selector: (context, jokeService) => jokeService.allJokes,
            builder: (context, jokes, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.05),
                  Text(
                    "DadJokes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Center(
                      child: SwipableStack(
                        controller: controller,
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
                            child: Text(""),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.rewind();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      IconButton(
                          onPressed: () {
                            jokeService.getJokes();
                            Navigator.pushReplacementNamed(
                                context, RouteConfig.home);
                          },
                          icon: Icon(Icons.refresh)),
                      IconButton(
                          onPressed: () {
                            controller.next(
                                swipeDirection: SwipeDirection.right);
                          },
                          icon: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
