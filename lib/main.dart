import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/models/match.dart';
import 'package:pangration_score/app/models/participant.dart';
import 'package:pangration_score/ui/AddAMatch.dart';
import 'package:pangration_score/ui/AddParticipant.dart';
import 'package:pangration_score/ui/LoginScreen.dart';

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

  CollectionReference matches = FirebaseFirestore.instance.collection(
      'matches');
  CollectionReference participants = FirebaseFirestore.instance.collection(
      'participants');


  Future<List<Match>> getFirebaseMatches() async {
    List<Match> pangrationMatches = new List();
    pangrationMatches.add(Match("",[],"",""));
    QuerySnapshot matchSnapshot = await matches.get();
    for(DocumentSnapshot matchRecord in matchSnapshot.docs) {
      Map<String, dynamic> matchData = matchRecord.data();
      var participantPaths = matchData['participants'];
      List<Participant> participantList = [];
      for (DocumentReference docRef in participantPaths) {
        await participants.doc(docRef.id).get()
            .then((snapshot) =>
        {
          participantList.add(Participant('123',
              snapshot.data()['first_name'],
              snapshot.data()['last_name'],
              snapshot.data()['age'],
              snapshot.data()['weight'],
              snapshot.data()['height']
          ))
        });
      }
      pangrationMatches.add(
          Match("", participantList, matchData['date'], matchData['result']));
    }
    return pangrationMatches;
  }

  Widget printFirebaseMatchesInAGridView(int count, Orientation orientation) {
    return FutureBuilder<List<Match>>(
      future: getFirebaseMatches(), // a Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Match>> snapshot) {
        if(snapshot.data == null) return Text("Hang on ... your data is loading ...");
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

  List<Widget> showAdminButtons() {
    List<Widget> buttonsList = [];
    buttonsList.add(ListTile(
      title: Text("Log in"),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen())
        );
      }
    ));
    if(FirebaseAuth.instance.currentUser == null) {
      buttonsList.removeAt(0);
      buttonsList.add(ListTile(
        title: Text("Log out"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          _signOutUser();
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen())
          );
        },
      ));
      buttonsList.add(ListTile(
        title: Text("Add a participant"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddParticipant())
          );
        },
      ));
      buttonsList.add(ListTile(
        title: Text("Add a match"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAMatch())
            );
          },
      ));
    }
    return buttonsList;
  }

  void _signOutUser() async {
    await FirebaseAuth.instance.signOut();
    FirebaseAuth.instance.currentUser
    setState(() {});
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Pangration Scoreboard"),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            children: showAdminButtons(),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: printFirebaseMatchesInAGridView(count,orientation)
        )
    );
  }
}
