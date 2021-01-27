import 'package:meta/meta.dart';
import 'package:pangration_score/app/models/participant.dart';

class Match {
  Match(
    this.uid,
    this.participants,
    this.date,
    this.result
  );

  String uid;
  List<Participant> participants;
  String date;
  String result;
}