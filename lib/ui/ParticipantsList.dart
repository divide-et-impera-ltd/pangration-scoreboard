import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pangration_score/app/models/participant.dart';
import 'package:pangration_score/app/models/match.dart';


class ParticipantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // <1> Use FutureBuilder
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('matches').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            List<Match> matches ;
            documents.forEach((doc) {
                print(doc["date"]);
                print(doc["result"]);
                List<Participant> participants = List<Participant>();
                doc['participants'].forEach((participant) {
                  print(participant.id);
                  FirebaseFirestore.instance.collection('participants').doc(participant.id).get().then((value) => {

                    Participant(firstName: value["first_name"],
                    lastName: value["last_name"],
                    age: value["age"],
                    weight: value["weight"],
                    height: value["height"]);

                    participants.add(p);

                  });
                });
            });


            return ListView(
                children: documents
                    .map((doc) => Card(
                          child: ListTile(
                            title: Text(doc['result']),
                            subtitle: Text(doc['date']),
                          ),
                        ))
                    .toList());
          } else if (snapshot.hasError) {
            return Text("It s Error!");
          }
        });
  }
}
