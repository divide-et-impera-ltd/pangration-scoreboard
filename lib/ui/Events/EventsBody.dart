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
    int count = 2;
    double ratio = 1.9;
    if (screenSize < 930) {
      count = 1;
      ratio = 2.5;
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