import 'package:flutter/material.dart';

class CardDisplay extends StatelessWidget {
  final String text;

  CardDisplay({this.text, this.cardColor});
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      width: size.width * 0.7,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 10,
          //color: Colors.transparent.withOpacity(0.3),
          color: Colors.black,
        ),
        boxShadow: [
          // BoxShadow(
          //   color: Color.fromRGBO(0, 0, 0, 0.22),
          //   offset: Offset(0, 0),
          //   blurRadius: 2,
          //   spreadRadius: 0,
          // ),
          // BoxShadow(
          //   color: Color.fromRGBO(0, 0, 0, 0.2),
          //   offset: Offset(1, 1),
          //   blurRadius: 2,
          //   spreadRadius: 0,
          // )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
