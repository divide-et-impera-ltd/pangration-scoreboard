import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/models/match.dart';
import 'package:sizer/sizer.dart';

class GridCell extends StatelessWidget {
  const GridCell({
    Key key,
    this.match,
  }) : super(key: key);

  final Match match;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double dateScale = 0.015, nameScale = 0.025, scoreScale = 0.02;
    if(width < 760) {
      dateScale = 0.04;
      nameScale = 0.065;
      scoreScale = 0.05;
    } else if (width >= 760 && width <1800) {
      dateScale = 0.025;
      nameScale = 0.035;
      scoreScale = 0.03;
    } if (width < 200) {
      dateScale = 0.00025;
      nameScale = 0.00035;
      scoreScale = 0.0003;
    }
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10.0,right: 30.0,top: 5.0),
                    child:FittedBox(
                        fit: BoxFit.fill,
                        child:
                        AutoSizeText(match.date,
                          style: TextStyle(
                              fontSize: width  * dateScale,
                              color: Colors.white
                          ),)
                    )),
                  Container(
                    margin:EdgeInsets.only(top:10.0),
                      child:FittedBox(
                          fit: BoxFit.fitHeight,
                          child:
                          AutoSizeText(match.participants[0].firstName + " "+ match.participants[0].lastName,
                            style: TextStyle(
                                fontSize: width  * nameScale,
                                color: Colors.white
                            ),)
                      )),
                  Container(
                    margin: EdgeInsets.only(top: width*0.02,bottom: width*0.005),
                      child:FittedBox(
                          fit: BoxFit.fitHeight,
                          child:
                          AutoSizeText(match.result.split(":").first,
                            style: TextStyle(
                                fontSize: width  * scoreScale,
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
                        margin: EdgeInsets.only(top: width*0.005,bottom: width*0.02),
                        child:FittedBox(
                            fit: BoxFit.fitHeight,
                            child:
                            AutoSizeText(match.result.split(":")[1],
                              style: TextStyle(
                                  fontSize: width  * scoreScale,
                                  color: Colors.white
                              ),)
                        )),
                      Container(
                          margin: EdgeInsets.only(bottom:width*0.03),
                          child:FittedBox(
                              fit: BoxFit.fitHeight,
                              child:
                              AutoSizeText(match.participants[1].firstName + " " + match.participants[1].lastName,
                                style: TextStyle(
                                    fontSize: width  * nameScale,
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