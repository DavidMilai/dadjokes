import 'package:dadjokes/data/models/shot_card.dart';
import 'package:flutter/material.dart';

class CardDisplay extends StatelessWidget {
  final ShotCard shotCard;

  CardDisplay({this.shotCard});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool screenSmall = screenWidth < 370;

    double _cardwidth = screenSmall ? 270.0 : 320.0;
    double _cardHeight = _cardwidth * 1.4375;
    // 1.4375 is the ratio of the height to the width

    return Transform.translate(
      offset: shotCard.offset ?? Offset(0, 0),
      child: Transform.rotate(
        angle: shotCard.rotateAngle ?? 0,
        child: Container(
          height: _cardHeight,
          width: _cardwidth,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: shotCard.color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 10,
              color: Colors.transparent.withOpacity(0.3),
              // color: Colors.black,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.22),
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                offset: Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // line1 is there for all cards
              Text(
                shotCard.text,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textScaleFactor: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
