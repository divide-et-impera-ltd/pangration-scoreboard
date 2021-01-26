import 'package:meta/meta.dart';
import 'package:pangration_score/app/models/participant.dart';

class Match {
  Match({
    this.participants,
    this.date,
    this.result
  });

  List<Participant> participants;
  String date;
  String result;

}