import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveEventCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double textSize = width * 0.040;
    print(textSize);
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 20,
          )
        ]
      ),
      margin: EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Nume si prenume",
                          style: TextStyle(
                            fontSize: textSize,
                            fontFamily: 'AppleTea'
                          ),),
                      ),
                      Container(
                        child: Text(
                            "Varsta",
                          style: TextStyle(
                              fontSize: textSize,
                              fontFamily: 'AppleTea'
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                            "0",
                          style: TextStyle(
                            fontSize: textSize,
                            fontFamily: 'AppleTea'
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.add),
                          ),
                          Container(
                            child: Icon(Icons.remove),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ),
            Divider(
              color: Colors.blue,
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Varsta",
                            style: TextStyle(
                                fontSize: textSize,
                                fontFamily: 'AppleTea'
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Nume si prenume",
                            style: TextStyle(
                                fontSize: textSize,
                                fontFamily: 'AppleTea'
                            ),),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "0",
                            style: TextStyle(
                                fontSize: textSize,
                                fontFamily: 'AppleTea'
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.add),
                            ),
                            Container(
                              child: Icon(Icons.remove),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
            ),
            Divider(
              color: Colors.blue,
            ),
            Expanded(child: Text("Expanded"))
          ],
        ),
      ),
    );
  }

}