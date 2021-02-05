import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize = 250;
    double factor = 0.015;
    if(width < 1900) {
      factor = 1;
    } else if (width < 1500) {
      imageSize = 0;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0,10), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                  ),
                  child: Image.asset("assets/images/pangration.jpg",
                      height: imageSize,
                      fit: BoxFit.fill)
              ),
              Column(
                children: [
                  Text("Titlu")
                ],
              ),
            ],
          ),
        )
      )
    );
  }

}