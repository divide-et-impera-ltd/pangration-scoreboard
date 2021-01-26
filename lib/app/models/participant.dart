import 'package:meta/meta.dart';

class Participant {
  Participant({
    @required this.uid,
    this.firstName,
    this.lastName,
    this.age,
    this.weight,
    this.height
  });

  String uid;
  String firstName;
  String lastName;
  int age;
  double weight;
  double height;
}