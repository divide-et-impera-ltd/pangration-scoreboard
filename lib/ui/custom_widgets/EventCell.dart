import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double titleSize = width * 0.022;
    double subtitleSize = width * 0.017;


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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child:
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)
                    ),
                    child: Image.asset("assets/images/pangration.jpg",
                        fit: BoxFit.fill)
                )
              ),
              Expanded(
                child:
                Container(
                  margin: EdgeInsets.only(bottom: 1,top: 4,left: 12,right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText("Titlu",
                          style:TextStyle(
                              fontSize: titleSize
                          )),
                      Text("Date + hour",
                          style: TextStyle(
                              fontSize: subtitleSize
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location",
                              style: TextStyle(
                                  fontSize: subtitleSize
                              )),
                          Text("Time estimation",
                              style: TextStyle(
                                  fontSize: subtitleSize
                              )),
                        ],
                      ),


                    ],
                  ),
                )
              )
            ],
          ),
        )
    );
  }

}