import 'package:dadjokes/services/jokes_service.dart';
import 'package:dadjokes/utils/color.dart';
import 'package:dadjokes/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> cardColor = [];

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
        body: Container(
          color: Colors.blue,
          child: Center(
            child: SwipableStack(
              stackClipBehaviour: Clip.antiAlias,
              itemCount: jokeService.allJokes.length,
              builder: (context, index, constraints) {
                cardColor.add(AppColors.getColor());
                var joke = jokeService.allJokes[index];
                return CardDisplay(
                  text: joke.text,
                  cardColor: cardColor[index],
                );
              },
              onSwipeCompleted: (index, direction) {
                print('$index, $direction');
              },
            ),
          ),
        ),

        // Column(
        //   children: [
        //     // Center(
        //     //   child: IconButton(
        //     //       onPressed: () {
        //     //         jokeService.getJokes();
        //     //       },
        //     //       icon: Icon(Icons.add)),
        //     // ),
        //     // Expanded(
        //     //   child: ListView.builder(
        //     //       itemCount: jokeService.allJokes.length,
        //     //       itemBuilder: (context, item) {
        //     //         var joke = jokeService.allJokes[item];
        //     //         return Text("${joke.text}*********");
        //     //       }),
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}
