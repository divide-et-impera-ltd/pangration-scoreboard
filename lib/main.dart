import 'package:flutter/material.dart';

import 'ui/custom_widgets/grid_cell.dart';


// <!-- The core Firebase JS SDK is always required and must be listed first -->
// <script src="/__/firebase/8.2.4/firebase-app.js"></script>
//
// <!-- TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries -->
// <script src="/__/firebase/8.2.4/firebase-analytics.js"></script>
//
// <!-- Initialize Firebase -->
// <script src="/__/firebase/init.js"></script>

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pangration Scoreboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    var screenSize = MediaQuery.of(context).size.width;
    int count = 0;
    if(screenSize < 450) {
      count = 1;
    } else if (orientation == Orientation.portrait) {
      count = 2;
    } else {
      count = 3;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Pangration Scoreboard"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisCount: count,
          childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
          children: <Widget>[
            for(var count = 0; count < 10; count++)
              GridCell(count: count)
          ],
        )
      )
    );
  }
}
