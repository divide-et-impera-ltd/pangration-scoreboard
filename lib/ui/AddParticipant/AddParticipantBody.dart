import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/Firebase/DatabaseController.dart';
import 'package:pangration_score/ui/custom_widgets/Background.dart';
import 'package:pangration_score/ui/custom_widgets/RoundedButton.dart';
import 'package:pangration_score/ui/custom_widgets/RoundedInputField.dart';
import 'package:pangration_score/ui/custom_widgets/RoundedNumberInputField.dart';

class AddParticipantBody extends StatelessWidget {

  final DatabaseController databaseController = DatabaseController();

  @override
  Widget build(BuildContext context) {
    String firstName, lastName;
    int age;
    double weight, height;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add a participant",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "First name",
              onChanged: (value) {
                firstName = value;
              },
            ),
            RoundedInputField(
              hintText: "Last name",
              onChanged: (value) {
                lastName = value;
              },
            ),
            RoundedNumberInputField(
              hintText: "Age",
              onChanged: (value) {
                age = int.parse(value);
              },
            ),
            RoundedNumberInputField(
              hintText: "Height(cm)",
              onChanged: (value) {
                height = double.parse(value);
              },
            ),
            RoundedNumberInputField(
              hintText: "Weight",
              onChanged: (value) {
                weight = double.parse(value);
              },
            ),
            RoundedButton(
              text: "Add a participant",
              press: () async {
                if(firstName == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("First name cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(lastName == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Last name cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(age == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Age cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(height == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Height cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(weight == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Weight cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                String message = await databaseController.addParticipant(firstName, lastName, age, weight, height);
                if(message == "Participant added") {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.green,
                    ));
                    return;
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ));
                  return;
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