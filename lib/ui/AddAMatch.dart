import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAMatch extends StatelessWidget {

  final String firstName;
  final String lastName;
  final int age;
  final double weight;
  final double height;

  const AddAMatch({Key key, this.firstName, this.lastName, this.age, this.weight, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CollectionReference participants = FirebaseFirestore.instance.collection('participants');

    Future<void> addParticipant() {
      return participants.add({
        'first_name': firstName,
        'last_name': lastName,
        'age': age,
        'weight': weight,
        'height': height
      })
          .then((value) => print("Participant added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return TextButton(
      onPressed: addParticipant,
      child: Text("Add participant"),
    );
  }

}