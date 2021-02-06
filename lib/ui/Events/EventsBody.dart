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
    double ratio = 2.0;
    if (screenSize < 1100) {
      count = 1;
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