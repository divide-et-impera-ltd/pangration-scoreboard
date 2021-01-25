import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GridCell extends StatelessWidget {
  const GridCell({
    Key key,
    @required this.count,
  }) : super(key: key);

  final int count;


  @override
  Widget build(BuildContext context) {
    // double fs = 30.0 * MediaQuery.of(context).size.width / 414.0;
    // double resultFontSize = 10.0 * MediaQuery.of(context).size.width / 414.0;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0,10), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(20),
      child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Expanded(
            child:
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child:FittedBox(
                       child:
                       AutoSizeText("Participant1",
                         maxLines: 1,
                         minFontSize: 30.0,
                         maxFontSize: 50.0,
                         stepGranularity: 5.0,
                         style: TextStyle(
                             color: Colors.white
                         ),)
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                      child:FittedBox(
                          child:
                          AutoSizeText(count.toString(),
                            maxLines: 1,
                            minFontSize: 25.0,
                            maxFontSize: 30.0,
                            stepGranularity: 5.0,
                            style: TextStyle(
                                color: Colors.white
                            ),)
                      ))]
              ),
            )
          ),
          Expanded(
              child:
              Container(
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Container(
                        child:FittedBox(
                            child:
                            AutoSizeText(count.toString(),
                              maxLines: 1,
                              minFontSize: 25.0,
                              maxFontSize: 30.0,
                              stepGranularity: 5.0,
                              style: TextStyle(
                                  color: Colors.white
                              ),)
                        )),
                      Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child:FittedBox(
                              child:
                              AutoSizeText("Participant2",
                                maxLines: 1,
                                minFontSize: 30.0,
                                maxFontSize: 50.0,
                                stepGranularity: 5.0,
                                style: TextStyle(
                                    color: Colors.white
                                ),)
                          ))]
                ),
              )
          ),]
        )
    );
  }
}