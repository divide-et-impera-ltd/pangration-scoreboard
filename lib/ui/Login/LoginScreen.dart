
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';
import 'package:pangration_score/ui/Login/LoginBody.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserInstanceController userInstanceController = UserInstanceController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blue
      ),
      drawer: Drawer(
        child: ListView(
          children: userInstanceController.showAdminButtons(context),
        ),
      ),
      body: LoginBody(),
    );
  }
}