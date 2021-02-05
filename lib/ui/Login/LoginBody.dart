
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';

import '../../main.dart';
import '../custom_widgets/Background.dart';
import '../custom_widgets/RoundedButton.dart';
import '../custom_widgets/RoundedInputField.dart';
import '../custom_widgets/RoundedPasswordField.dart';



class LoginBody extends StatelessWidget {

  final UserInstanceController userInstanceController = UserInstanceController();


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
                String code = await userInstanceController.signInUser(userName,password);
                switch(code) {
                  case "login-passed":
                    Navigator.pop(context,true);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => App())
                    );
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