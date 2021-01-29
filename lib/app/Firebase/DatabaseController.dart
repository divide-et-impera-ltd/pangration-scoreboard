

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pangration_score/app/models/participant.dart';
import 'package:pangration_score/app/models/match.dart';

class DatabaseController {

  CollectionReference matches = FirebaseFirestore.instance.collection(
      'matches');
  CollectionReference participants = FirebaseFirestore.instance.collection(
      'participants');


  Future<List<Match>> getFirebaseMatches() async {
    List<Match> pangrationMatches = new List();
    pangrationMatches.add(Match("",[],"",""));
    QuerySnapshot matchSnapshot = await matches.get();
    for(DocumentSnapshot matchRecord in matchSnapshot.docs) {
      Map<String, dynamic> matchData = matchRecord.data();
      var participantPaths = matchData['participants'];
      List<Participant> participantList = [];
      for (DocumentReference docRef in participantPaths) {
        await participants.doc(docRef.id).get()
            .then((snapshot) =>
        {
          participantList.add(Participant('123',
              snapshot.data()['first_name'],
              snapshot.data()['last_name'],
              snapshot.data()['age'],
              snapshot.data()['weight'],
              snapshot.data()['height']
          ))
        });
      }
      pangrationMatches.add(
          Match("", participantList, matchData['date'], matchData['result']));
    }
    return pangrationMatches;
  }

  Future<List<Participant>> getFirebaseParticipants() async {
    List<Participant> participantList = [];
    await participants.get()
        .then((querySnapshot) =>
    {
      for(DocumentSnapshot snapshot in querySnapshot.docs) {
        participantList.add(Participant(snapshot.id,
            snapshot.data()['first_name'],
            snapshot.data()['last_name'],
            snapshot.data()['age'],
            snapshot.data()['weight'],
            snapshot.data()['height']
        ))
      }
    });
    return participantList;
  }

  Future<String> addParticipant(String firstName, String lastName, int age, double weight, double height) async {
    try {
      await participants.add({
        'first_name': firstName,
        'last_name': lastName,
        'age': age,
        'weight': weight,
        'height': height
      });
      return "Participant added";
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<String> addMatch(String date, String result, List<Participant> participants) async {
    try {
    List<DocumentReference> participantsReferences = [];
    for(Participant participant in participants) {
      await this.participants.doc(participant.uid).get().then((value) => {
        participantsReferences.add(value.reference)
      });
    }
    await matches.add({
      'date': date,
      'result': result,
      'participants': participantsReferences
    });
      return "Match added";
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}