
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Background.dart';
import 'RoundedButton.dart';
import 'RoundedInputField.dart';
import 'RoundedPasswordField.dart';



class LoginBody extends StatelessWidget {

  const LoginBody({Key key}) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userName;
    String password;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                userName = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if(userName == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("E-mail address cannot be empty!"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(password == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Password cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                String code = await signInUser(userName,password);
                switch(code) {
                  case "login-passed":
                    Navigator.pop(context,true);
                    break;
                  case "user-not-found":
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Wrong e-mail"),
                      backgroundColor: Colors.red,
                    ));
                    break;
                  case 'wrong-password':
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Wrong password"),
                      backgroundColor: Colors.red,
                    ));
                    break;
                }
              },
            ),
            SizedBox(height: size.height * 0.03)
          ],
        ),
      ),
    );
  }

}