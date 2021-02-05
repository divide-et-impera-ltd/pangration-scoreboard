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
import 'package:pangration_score/ui/Events/EventsScreen.dart';
import 'package:pangration_score/ui/Matches/AddMatch/AddMatchBody.dart';
import 'package:pangration_score/ui/Login/LoginScreen.dart';
import 'package:pangration_score/ui/Matches/AddMatch/AddMatchScreen.dart';
import 'package:pangration_score/ui/Matches/MatchesResults/MatchesResultsBody.dart';

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
  runApp(App());
}


class AppRoutes {
  static const String home = "home";
}

class _AppStateProvider extends InheritedWidget {
  final AppState state;

  _AppStateProvider({this.state, child}) : super(child: child);

  @override
  bool updateShouldNotify(_AppStateProvider old) => false;
}

class App extends StatefulWidget {
  State<App> createState() => AppState();
}

class AppNavigator {
  static NavigatorState of(BuildContext context) {
    return AppState.of(context).navKey.currentState;
  }
}

class AppState extends State<App> {
  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppStateProvider)
    as _AppStateProvider)
        .state;
  }

  final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return _AppStateProvider(
      state: this,
      child: MaterialApp(
        navigatorKey: navKey,
        initialRoute: AppRoutes.home,
        routes: <String, WidgetBuilder>{
          AppRoutes.home: (BuildContext context) => EventsScreen(),
        },
      ),
    );
  }

}



