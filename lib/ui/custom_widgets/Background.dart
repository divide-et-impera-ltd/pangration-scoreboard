import 'package:flutter/material.dart';

import '../../main.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child:GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => App())
                );
              }, // handle your image tap here
              child: Image.asset(
                "assets/images/pangration.png",
                width: size.width * 0.4,
              ),
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child:
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => App())
                );
              }, // handle your image tap here
              child: Image.asset(
                "assets/images/pangration.png",
                width: size.width * 0.4,
              ),
            )

          ),
          child,
        ],
      ),
    );
  }
}