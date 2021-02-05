import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/ui/custom_widgets/EventCell.dart';

class EventsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size
        .width;
    int count = 0;
    double ratio = 0.0;
    if (screenSize < 1900) {
      count = 1;
      ratio = 3.0;
    } else {
      count = 2;
      ratio = 2.0;
    }
    if(screenSize < 1600) {
      count = 1;
      ratio = 2.0;
    }
    if(screenSize < 1100) {
      ratio = 1.5;
    }
    if(screenSize < 1000) {
      ratio = 1.5;
    }
    if(screenSize < 900) {
      ratio = 1.3;
    }
    if (screenSize < 760) {
      count = 1;
      ratio = 1.2;
    }
    if(screenSize < 700) {
      ratio = 1.0;
    }
    if(screenSize < 600) {
      ratio = 0.9;
    }
    if(screenSize < 500) {
      ratio = 0.8;
    }
    if(screenSize < 400) {
      ratio = 0.7;
    }
    if(screenSize < 350) {
      ratio = 0.5;
    }

    return Scaffold(
      body: Center(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisCount: count,
            childAspectRatio: ratio,
            children: [EventCell(),EventCell(),EventCell()]
        )
      ),
    );
  }

}