import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';
import 'package:pangration_score/ui/Matches/AddMatch/AddMatchBody.dart';


class AddMatchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    UserInstanceController userInstanceController = UserInstanceController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a match"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: userInstanceController.showAdminButtons(context),
        ),
      ),
      body: MyAddMatchBody(),
    );
  }
}