import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/models/participant.dart';
import 'package:pangration_score/ui/AddMatch/AddMatchBody.dart';


class RoundedDropDownButton extends StatelessWidget {

  final List<Participant> participants;
  final ValueChanged<Participant> onChanged;
  Participant selectedValue;

  RoundedDropDownButton({
    Key key,
    this.participants,
    this.onChanged,
    this.selectedValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Participant selectedParticipant = participants.first;
    return Container(
      padding:
      EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(29)),
      child: DropdownButton<Participant>(
        value: selectedValue,
        onChanged: onChanged,
      isExpanded: true,
      underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down_circle_sharp),
        iconEnabledColor: Colors.white,
        items: participants.map((Participant participant) {
          return new DropdownMenuItem<Participant>(
            value: participant,
            child: new Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.blue),
              child: Text(
                participant.firstName + " " + participant.lastName,
                style: new TextStyle(color: Colors.white),
              )
            ),
          );
        }).toList(),
      )
    );
  }

}