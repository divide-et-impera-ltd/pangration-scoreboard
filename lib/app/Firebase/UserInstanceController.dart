


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/main.dart';
import 'package:pangration_score/ui/AddMatch/AddMatchScreen.dart';
import 'package:pangration_score/ui/AddParticipant/AddAParticipantScreen.dart';
import 'package:pangration_score/ui/Login/LoginScreen.dart';

class UserInstanceController {



  List<Widget> showAdminButtons(BuildContext context) {
    List<Widget> buttonsList = [];
    buttonsList.add(ListTile(
        title: Text("Home page"),
        trailing: Icon(Icons.home),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage())
          );
        }
    ));

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if(user == null) {
        buttonsList.clear();
        buttonsList.add(ListTile(
            title: Text("Home page"),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage())
              );
            }
        ));
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
      } else {
        buttonsList.clear();
        buttonsList.add(ListTile(
            title: Text("Home page"),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage())
              );
            }
        ));
        buttonsList.add(ListTile(
          title: Text("Log out"),
          trailing: Icon(Icons.arrow_back),
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
          trailing: Icon(Icons.add),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAParticipantScreen())
            );
          },
        ));
        buttonsList.add(ListTile(
          title: Text("Add a match"),
          trailing: Icon(Icons.add),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMatchScreen())
            );
          },
        ));
      }
    });
    return buttonsList;
  }

  void _signOutUser() async {
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