import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pangration_score/app/Firebase/DatabaseController.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';
import 'package:pangration_score/app/models/match.dart';
import 'package:pangration_score/app/models/participant.dart';
import 'package:pangration_score/ui/AddMatch/AddMatchScreen.dart';
import 'package:pangration_score/ui/Login/LoginScreen.dart';

import 'ui/custom_widgets/grid_cell.dart';
import 'package:sizer/sizer.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
  


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text("Firebase initialization has error"),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Pangration Scoreboard',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(title: 'Pangration Scoreboard'),
            );
          }
          return CupertinoActivityIndicator();
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final DatabaseController databaseController = DatabaseController();

  Widget printFirebaseMatchesInAGridView(int count, Orientation orientation) {
    return FutureBuilder<List<Match>>(
      future: databaseController.getFirebaseMatches(), // a Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Match>> snapshot) {
        if(snapshot.data == null) return LoadingBouncingGrid.square(size: 70.0, backgroundColor: Colors.blue);
        if(snapshot.hasError) return new Text("Oops! Something must have gone wrong :(");
        if(snapshot.data.isEmpty) return new Text("empty");
        List<Widget> gridCells = [];
        for(Match match in snapshot.data) {
          if(match.participants.isNotEmpty) {
            print(match.result);
            gridCells.add(GridCell(match: match));
          }
        }
        return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisCount: count,
          childAspectRatio: (orientation == Orientation.portrait)
              ? 1.0
              : 1.3,
          children: gridCells
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    //Widget text = printFirebaseMatches();
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    var screenSize = MediaQuery
        .of(context)
        .size
        .width;
    int count = 0;
    if (screenSize < 760) {
      count = 1;
    } else if (screenSize < 1800) {
      count = 2;
    } else {
      count = 3;
    }
    UserInstanceController userInstanceController = UserInstanceController();
    return Scaffold(
        appBar: AppBar(
          title: Text("Pangration Scoreboard"),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            children: userInstanceController.showAdminButtons(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: printFirebaseMatchesInAGridView(count,orientation)
        )
    );
  }
}
