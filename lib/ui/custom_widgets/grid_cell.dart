import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  const GridCell({
    Key key,
    @required this.count,
  }) : super(key: key);

  final int count;


  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(count.toString(),)]
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text(count.toString(),)]
                ),
              )
          ),]
        )
    );
  }
}