import 'dart:math';

import 'package:dadjokes/data/models/joke.dart';
import 'package:dadjokes/services/jokes_service.dart';
import 'package:dadjokes/utils/color.dart';
import 'package:dadjokes/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> cardColor = [];
  List<int> number = [];
  Random random = new Random();
  SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();

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
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    jokeService.getJokes();
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Selector<JokeService, List<Joke>>(
                  selector: (context, jokeService) => jokeService.allJokes,
                  builder: (context, jokes, _) {
                    jokes.forEach((element) {
                      cardColor.add(AppColors.getColor());
                    });
                    return SwipeableCardsSection(
                      cardController: _cardController,
                      context: context,
                      items: [
                        CardDisplay(
                          text: jokes[0].text,
                          cardColor: cardColor[0],
                        ),
                        CardDisplay(
                          text: jokes[1].text,
                          cardColor: cardColor[1],
                        ),
                        CardDisplay(
                          text: jokes[2].text,
                          cardColor: cardColor[2],
                        ),
                      ],
                      onCardSwiped: (dir, index, widget) {
                        jokeService.getJokes();
                        cardColor.add(AppColors.getColor());
                        _cardController.addItem(CardDisplay());
                      },
                      enableSwipeUp: true,
                      enableSwipeDown: false,
                    );
                  }),
            ],
          )),
    );
  }
}
