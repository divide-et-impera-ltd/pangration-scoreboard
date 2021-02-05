
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/Firebase/DatabaseController.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';
import 'package:pangration_score/app/models/participant.dart';
import 'package:pangration_score/ui/custom_widgets/RoundedDropDownButton.dart';
import 'package:pangration_score/ui/custom_widgets/RoundedNumberInputField.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/Background.dart';
import '../../custom_widgets/RoundedButton.dart';
import '../../custom_widgets/RoundedInputField.dart';
import '../../custom_widgets/RoundedPasswordField.dart';


class MyAddMatchBody extends StatefulWidget {
  MyAddMatchBody({Key key, this.title}) : super(key: key);
  final String title;

  @override
  AddMatchBody createState() => AddMatchBody();
}


class AddMatchBody extends State<MyAddMatchBody> {

  final DatabaseController databaseController = DatabaseController();
  final List<Participant> firstParticipantList = [];
  final List<Participant> secondParticipantList = [];
  Participant participantFirst = Participant("", "Select the first", " participant", 12, 12, 12), participantSecond = Participant("", "Select the second", " participant", 12, 12, 12);
  String date, result;

  @override
  Future<void> initState() {
    super.initState();
    firstParticipantList.add(participantFirst);
    secondParticipantList.add(participantSecond);
     initializeParticipantsList();
  }

  Future<void> initializeParticipantsList() async {
    List<Participant> dbList =  await this.databaseController.getFirebaseParticipants();
    for(Participant participant in dbList) {
      firstParticipantList.add(participant);
      secondParticipantList.add(participant);
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context)  {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add a match",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Date",
              onChanged: (value) {
                date = value;
              },
            ),
            RoundedInputField(
              hintText: "Result ( number : number )",
              onChanged: (value) {
                result = value;
              },
            ),
            RoundedDropDownButton(
              participants: firstParticipantList,
              onChanged: (participant) {
                setState(() {
                  participantFirst = participant;
                });
                print(participantFirst.firstName);
              },
              selectedValue: participantFirst,
            ),
            SizedBox(height: size.height * 0.01),
            RoundedDropDownButton(
              participants: secondParticipantList,
              onChanged: (participant) {
                setState(() {
                  participantSecond = participant;
                });
              },
              selectedValue: participantSecond
            ),
            RoundedButton(
              text: "Add match",
              press: () async {
                print(date);
                if(date == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Date cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(result == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Result cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(participantFirst.firstName == "Select the first") {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("You must select the first participant"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if(participantSecond.firstName == "Select the second") {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("You must select the second participant"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                List<Participant> selectedParticipants = [];
                selectedParticipants.add(participantFirst);
                selectedParticipants.add(participantSecond);
                String message = await databaseController.addMatch(date, result, selectedParticipants);
                if(message == "Match added") {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Match added"),
                    backgroundColor: Colors.green,
                  ));
                  return;
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ));
                }
            }
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}