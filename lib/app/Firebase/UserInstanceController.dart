


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/main.dart';
import 'package:pangration_score/ui/Events/EventsScreen.dart';
import 'package:pangration_score/ui/Events/LiveEvents/LiveEventsScreen.dart';
import 'package:pangration_score/ui/Matches/AddMatch/AddMatchBody.dart';
import 'package:pangration_score/ui/AddParticipant/AddAParticipantScreen.dart';
import 'package:pangration_score/ui/Login/LoginScreen.dart';
import 'package:pangration_score/ui/Matches/AddMatch/AddMatchScreen.dart';
import 'package:pangration_score/ui/Matches/MatchesResults/MatchesResultsBody.dart';
import 'package:pangration_score/ui/custom_widgets/SideMenuButton.dart';

class UserInstanceController {



  List<Widget> showAdminButtons(BuildContext context) {
    List<Widget> buttonsList = [];
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      buttonsList.clear();
      buttonsList.add(SideMenuButton("Events", Icon(Icons.accessibility),EventsScreen()));
      buttonsList.add(SideMenuButton("Live Events", Icon(Icons.live_tv),LiveEventsScreen()));
      buttonsList.add(SideMenuButton("Participants Ranking", Icon(Icons.format_align_right_rounded),MatchesResultBody()));
      if(user == null) {
        buttonsList.add(SideMenuButton("Log in", Icon(Icons.arrow_forward),LoginScreen()));
      } else {
        buttonsList.add(SideMenuButton("Add a participant", Icon(Icons.add),AddAParticipantScreen()));
        buttonsList.add(SideMenuButton("Log out", Icon(Icons.arrow_back),LoginScreen()));
      }
    });
    return buttonsList;
  }

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> signInUser(String userName, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userName,
          password: password
      );
      return "login-passed";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      }
    }
  }
}